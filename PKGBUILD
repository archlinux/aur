# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: falkTX <falktx at gmail dot com>

pkgname=carla
pkgver=1.9.7
pkgrel=1
pkgdesc="Audio Plugin Host"
arch=('i686' 'x86_64')
url="http://kxstudio.sf.net/carla"
license=('GPL2')
depends=('file' 'fftw' 'fluidsynth' 'glu' 'liblo' 'linuxsampler' 'mxml' 'ntk-git' 'projectm' 'python' 'zlib')
makedepends=('gtk2' 'gtk3'  'pygtk' 'python-pyliblo' 'python-pyqt4' 'python-pyqt5' 'python-rdflib' 'qt4' 'qt5-base' 'zynaddsubfx')
optdepends=(
  'gtk2: LV2 GTK2 UI support'
  'gtk3: LV2 GTK3 UI support'
  'pygtk: NekoFilter UI'
  'python-pyliblo: OSC support'
  'python-rdflib: LADSPA-RDF support'
  'qt4: LV2 QT4 UI support'
  'qt5-base: LV2 QT5 UI support'
  'zynaddsubfx: ZynAddSubFX banks'
)
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("https://github.com/falkTX/Carla/archive/${pkgver}.tar.gz")
sha512sums=('f8b7247eace54a49398800a377efa9fb88267d52ccd0297a6fb4b64c04da24ac10260bdfe8ee8f7d15e13928dcc15c3e84a66f7c97c6a11c2bbe0e74b1d60587')

build() {
  cd "${srcdir}/Carla-${pkgver}"
  make DEFAULT_QT=5
}

package() {
  cd "${srcdir}/Carla-${pkgver}"
  make DEFAULT_QT=5 DESTDIR="${pkgdir}/" PREFIX=/usr install
}
