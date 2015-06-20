pkgname=tcl-cookfs
pkgver=1.4
pkgrel=4
pkgdesc="cookfs file system for tcl"
arch=('i686' 'x86_64')
url="http://www.endorser.org/en/blog/tcl/cookfs"
license=('custom')
depends=(tcl tcl-vfs tcllib)
makedepends=(tcl)
source=(https://github.com/l3iggs/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('4e9c8c2a49a0499207911bdca0801df9')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -D -m644 license.terms "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
