pkgname=tcl-tabs
pkgver=20150314
pkgrel=4
pkgdesc="Tcl Automated Build System"
arch=('i686' 'x86_64')
url="http://www.endorser.org/en/blog/tcl/tabs"
license=('custom')
depends=(tcl tcl-cookfs)
conflicts=()
source=(https://github.com/l3iggs/tcl-tabs/archive/v${pkgver}.tar.gz)
md5sums=('882dad0eb289114c4b0fe2d7ee98c598')

build() {
  cd "$pkgname-$pkgver" 
  tclsh build.tcl
}

package() {
  install -Dm755 "$srcdir"/"$pkgname-$pkgver"/OUT/* -t "$pkgdir"/opt/$pkgname
}
