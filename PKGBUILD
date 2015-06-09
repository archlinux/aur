# Maintainer: Stunts <f.pinamartins@gmail.com>

pkgname=bayescan
_up_pkgname=BayeScan
pkgver=2.1
pkgrel=1
pkgdesc="Detecting natural selection from population-based genetic data"
arch=('i686' 'x86_64')
url="http://cmpg.unibe.ch/software/BayeScan/index.html"
license=('GPL3')
depends=('gcc-libs')
source=("http://cmpg.unibe.ch/software/BayeScan/files/${_up_pkgname}${pkgver}.zip")
md5sums=('826138562f4c944e5649b65ca47624ec')

prepare() {
  #Remove static link
  cd ${srcdir}/${_up_pkgname}${pkgver}/source
  sed -i 's/-static//' Makefile
}

build() {
  cd ${srcdir}/${_up_pkgname}${pkgver}/source
  make
}

package() {
  install -D $srcdir/${_up_pkgname}${pkgver}/source/${pkgname}_${pkgver} $pkgdir/usr/bin/${pkgname}
}
