# Maintainer: Arun Narayanankutty <n.arun.lifescience@gmail.com>

pkgname=alphaplot
pkgver=0.01_alpha_prerelease_git
pkgrel=1
pkgdesc="Application for Scientific Data Analysis and Visualization, fork of SciDavis / QtiPlot"
url='http://alphaplot.sourceforge.net/'
arch=('i686' 'x86_64')
license=('GPL2')

# make dependancies
makedepends=('boost' 'cmake')
depends=('gsl' 'glu' 'mesa' 'shared-mime-info' 'qt4' 'qwt5' 'qwtplot3d')

# source download from git repo & prepare
source=(git+https://github.com/narunlifescience/alphaplot.git#branch=release-0.01A-alpha)
install=${pkgname}.install
sha256sums=('SKIP')
prepare() {
  cd "${srcdir}"
}

# start building
build() {
  cd "${srcdir}/${pkgname}"
  qmake-qt4
  make
}

# prepare package
package() {
  cd "${srcdir}/${pkgname}"
  make INSTALL_ROOT="${pkgdir}" DESTDIR="${pkgdir}" install
} 
