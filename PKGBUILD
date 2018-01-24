# Maintainer: Llewelyn Trahaearn <WoefulDerelict [at] GMail [dot] com>
# Contributor: falkTX <falktx [at] gmail [dot] com>

pkgname=carla
pkgver=1.9.8
pkgrel=1
pkgdesc="Audio Plugin Host"
arch=('i686' 'x86_64')
url="http://kxstudio.sf.net/carla"
license=('GPL2')
depends=('file' 'fftw' 'fluidsynth' 'glu' 'liblo' 'linuxsampler' 'mxml' 'ntk-git' 'projectm' 'python' 'python-pyqt5' 'qt5-svg' 'zlib')
makedepends=('gtk2' 'gtk3' 'python-pyliblo' 'python-rdflib' 'qt4' 'zynaddsubfx')
optdepends=(
  'gtk2: LV2 GTK2 UI support'
  'gtk3: LV2 GTK3 UI support'
  'python-pyliblo: OSC support'
  'python-rdflib: LADSPA-RDF support'
  'qt4: LV2 QT4 UI support'
  'zynaddsubfx: ZynAddSubFX banks'
)
source=("https://github.com/falkTX/Carla/archive/${pkgver}.tar.gz")
sha512sums=('0f801fdf7704bb3eb62e684134567df3e83a6c7dfad201479039158480f9fbc0c9a91bc007131091c29a87b4cbb2d831797c8c517de9c36399ec7348a8889f5d')

build() {
  cd "Carla-${pkgver}"
  make DEFAULT_QT=5
}

package() {
  cd "Carla-${pkgver}"
  make DEFAULT_QT=5 DESTDIR="${pkgdir}/" PREFIX=/usr install
}
