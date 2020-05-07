# Maintainer: Arun Narayanankutty <n.arun.lifescience@gmail.com>

pkgname=alphaplot
pkgver=1.011
pkgrel=1
pkgdesc="Application for Scientific Data Analysis and Visualization, fork of SciDavis / QtiPlot"
url='http://alphaplot.sourceforge.net/'
arch=('i686' 'x86_64')
license=('GPL2')

# make dependancies
makedepends=('boost' 'cmake' 'qt5-tools' 'qt5-datavis3d')
depends=('gsl' 'glu' 'mesa' 'shared-mime-info' 'desktop-file-utils')

# source download from git repo & prepare
source=(https://sourceforge.net/projects/alphaplot/files/1.011/AlphaPlot%20Release%202020-2.zip)
install=${pkgname}.install
sha512sums=('447c1188ef546940f626a683b32e8e5ba41d89d3b1b8f9030cc1aa4564fd4e9fe9dec8b3dc80e9fa3702d1579831dc0239a197e8a9d618119432ab0e481d09c9')
prepare() {
  cd "${srcdir}"
}

# start building
build() {
  mv */ alphaplot
  cd "${pkgname}"
  qmake
  make
}

# prepare package
package() {
  cd "${srcdir}/${pkgname}"
  make INSTALL_ROOT="${pkgdir}" DESTDIR="${pkgdir}" install
} 
