# Maintainer: GI_Jack <GI_Jack@hackermail.com>


pkgname=enum4linux
pkgver=0.9.0
pkgrel=1
pkgdesc="A tool for enumerating information from Windows and Samba systems."
arch=('any')
url="https://github.com/CiscoCXSecurity/enum4linux"
license=('GPL')
depends=('perl' 'smbclient' 'polenum' 'openldap')
source=("https://github.com/CiscoCXSecurity/enum4linux/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('be0540529e91839ef3f136e8af188f4a8ef64ba8ff1edb636a759ac70e35c25c80aa7bca276dee3519337772b799fcb21c19feada1e9f81b39952f2f86d8d4ae')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's|polenum.py|polenum|' ${pkgname}.pl
}

package() {
  cd "$srcdir/enum4linux-$pkgver"

  install -Dm755 enum4linux.pl "$pkgdir/usr/bin/enum4linux"
  install -Dm644 share-list.txt "$pkgdir/usr/share/enum4linux/share-list.txt"
}
