# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

_pkgname=libasr
pkgname=libasr-snapshot
pkgver=201602131606
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
sha256sums=('e5684a08d5eb61d68a94a24688f23bee8785c8a51a1bd34c88cae5aee5aa6da2')

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
 
