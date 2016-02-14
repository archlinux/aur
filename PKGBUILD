# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: falkTX <falktx at gmail dot com>

pkgname=carla
pkgver=1.2.4
pkgrel=3
pkgdesc="Audio Plugin Host"
arch=('i686' 'x86_64')
url="http://kxstudio.sf.net/carla"
license=('GPL2')
depends=('fftw' 'fluidsynth' 'liblo' 'libsmf' 'linuxsampler-svn' 'mxml' 'ntk-git' 'python' 'qt4' 'zlib')
makedepends=('gtk2' 'gtk3' 'pygtk' 'python-pyliblo' 'python-pyqt4' 'python-rdflib' 'qt5-base' 'zynaddsubfx')
optdepends=(
  'gtk2: LV2 GTK2 UI support'
  'gtk3: LV2 GTK3 UI support'
  'pygtk: NekoFilter UI'
  'python-pyliblo: Carla-Control'
  'python-rdflib: LADSPA-RDF support'
  'qt5-base: LV2 UI support'
  'zynaddsubfx: ZynAddSubFX banks'
)
provides=("${pkgname}")
conflicts=("${pkgname}-git")
install=${pkgname}.install
source=("https://downloads.sourceforge.net/project/kxstudio/Releases/${pkgname}/Carla-${pkgver}-src.tar.bz2")
sha512sums=('bc0fd43cc2237abafc5676d1e0a002d0d85ccdf588d681f6f9e63fd4af99125de2dd31c442ae55b17d2ebfc732dfbeaf238f4cab018e100c2e76df719298fe51')

build() {
  cd "${srcdir}/Carla-${pkgver}"
  make
}

package() {
  cd "${srcdir}/Carla-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX=/usr install
}
