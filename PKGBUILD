# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

_pkgname=libasr
pkgname=libasr-snapshot
pkgver=201505061057
pkgrel=1
pkgdesc='A FREE asynchronous DNS resolver.'
arch=('i686' 'x86_64')
url="https://github.com/OpenSMTPD/libasr"
license=('BSD')
depends=('libevent' 'openssl')
provides=('libasr')
conflicts=('libasr')
options=(!strip)
source=("http://www.opensmtpd.org/archives/$_pkgname-$pkgver.tar.gz")
sha256sums=('50ad9ed14ab0eb2abd27cfd45047f49b5470ec48717e2d024b017fa43c69f69d')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="${pkgdir}/" install

  install -Dm644 LICENCE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
 
