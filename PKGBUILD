# Maintainer: Arun Narayanankutty <n.arun.lifescience@gmail.com>

pkgname=alphaplot
pkgver=1.011A
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
sha256sums=('ec561634dd26643072d3f841c4823e957af30c67c49a20c894bb38d2e2757dea08e2f2c185903e566bc13dbfff31bae953a1c56063c96c60cb5357400f40aea5')
prepare() {
  cd "${srcdir}"
}

# start building
build() {
  cd "${srcdir}/${pkgname}"
  qmake
  make
}

# prepare package
package() {
  cd "${srcdir}/${pkgname}"
  make INSTALL_ROOT="${pkgdir}" DESTDIR="${pkgdir}" install
} 
