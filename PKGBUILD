# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>

pkgname=libngf
pkgver=0.28
pkgrel=1
pkgdesc="Library for Non-Grafic Feedback."
url="https://git.sailfishos.org/mer-core/libngf"
arch=(any)
license=(GPL)
depends=() 
makedepends=(check)
checkdepends=()
groups=(mer)
source=("${pkgname}::git+${url}#tag=${pkgver}")
sha256sums=('SKIP')

 build() {
  cd $pkgname
  ./autogen.sh --prefix=/usr
  make
 }

package() {
  cd $pkgname
  make DESTDIR=$pkgdir install
  libtool --finish /usr/lib
}
