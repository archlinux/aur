# Maintainer: ber532k <ber532k@gmx.de>

pkgname=libxlsxwriter
pkgver=0.7.4
pkgrel=1
pkgdesc='A C library for creating Excel XLSX files.'
arch=('i686' 'x86_64')
url='http://libxlsxwriter.github.io'
depends=(zlib)
makedepends=(git)
license=('BSD')
source=("https://github.com/jmcnamara/libxlsxwriter/archive/RELEASE_$pkgver.tar.gz")
md5sums=('7d898ff4475a41147cf50e15ca25fa1d')

build() {
  cd "$srcdir/$pkgname-RELEASE_$pkgver/"
  make
}

package() {
  cd "$srcdir/$pkgname-RELEASE_$pkgver"
  mkdir -p "$pkgdir/usr/include"
  cp -r include/* "$pkgdir/usr/include/"
  mkdir -p "$pkgdir/usr/lib"
  cp -r lib/* "$pkgdir/usr/lib/"
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
