# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Stefan J. Betz <info@stefan-betz.net>
pkgname='pius'
pkgver='2.2.4'
pkgrel=1
pkgdesc='PGP Individual UID Signer (PIUS)'
arch=('any')
url='http://www.phildev.net/pius/'
license=('GPL2')
install="$pkgname.install"
depends=('python2')
optdepends=('python2-pexpect: interactive mode support')
source=("https://github.com/jaymzh/pius/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2"
        "https://github.com/jaymzh/pius/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2.asc")
validpgpkeys=('121BDA2D4ACB63616B367A0E58E11BB1E414D9AD')
sha256sums=('96500c7e2ae47a41b97209b0e709f71dedc54fb01375f54dc00bbbc66f04ec51'
            'SKIP')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  for f in README.md README-keyring-mgr.md README-report.md
  do
    install -Dm644 "$f" "$pkgdir/usr/share/doc/pius/$f"
  done
}
