# Maintainer:
# Contributor: Arun Narayanankutty <n.arun.lifescience@gmail.com>

## useful links
# https://alphaplot.sourceforge.io/
# https://github.com/narunlifescience/AlphaPlot

_pkgname="alphaplot"
pkgname="$_pkgname"
pkgver=1.02
pkgrel=1
pkgdesc="Application for Scientific Data Analysis and Visualization, fork of SciDavis / QtiPlot"
url="https://github.com/narunlifescience/AlphaPlot"
arch=('i686' 'x86_64')
license=('GPL-2.0-or-later')

depends=(
  'gsl'
  'hicolor-icon-theme'
  'qt5-datavis3d'
  'qt5-script'
  'qt5-svg'
)
makedepends=(
  'boost'
  'cmake'
  'glu'
  'qt5-tools'
)

conflicts=(alphaplot-bin)

_pkgsrc="AlphaPlot-$pkgver"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver.$_pkgext"::"$url/archive/refs/tags/$pkgver.$_pkgext")
sha256sums=('90952b2036b9d25b31c0c8fb34c47ff700bb2847234dda42d900070fc60d3c61')

build() {
  cd "$_pkgsrc"
  # Note: PREFIX is not used
  qmake
  make
}

package() {
  cd "$_pkgsrc"
  # Note: DESTDIR is ignored
  make INSTALL_ROOT="$pkgdir" install
}
