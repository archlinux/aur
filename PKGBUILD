# Maintainer: Jonhnny Weslley <jw@jonhnnyweslley.net>
pkgname=localtld
pkgver=0.1.0
pkgrel=1
pkgdesc="glibc plugin providing host name resolution for local top-level domains"
arch=('i686' 'x86_64')
url="https://github.com/jweslley/$pkgname"
license=('MIT')
depends=('glibc')
install=$pkgname.install
options=('!strip' '!emptydirs')
source=("https://github.com/jweslley/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('95507c79771f919618a46012cac905d2')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 libnss_localtld.so.2 "$pkgdir"/lib/libnss_localtld.so.2
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
