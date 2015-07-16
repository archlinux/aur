# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: falkTX <falktx at gmail dot com>

pkgname=carla
pkgver=1.2.4
pkgrel=1
pkgdesc="Audio Plugin Host"
arch=('i686' 'x86_64')
url="http://kxstudio.sf.net/carla"
license=('GPL2')
depends=(
  'clthreads'
  'clxclient'
  'ffmpeg'
  'fluidsynth'
  'glu'
  'liblo'
  'libpng12'
  'libsmf'
  'linuxsampler-svn'
  'ntk-git'
  'python-pyliblo'
  'python-pyqt4'
  'mxml'
  'zita-convolver'
  'zita-resampler'
)
makedepends=('gtk2' 'gtk3')
optdepends=(
  'gtk2: lv2 gtk2 ui support'
  'gtk3: lv2 gtk3 ui support'
  'pygtk: NekoFilter UI'
  'zlib: extra native plugins'
  'zynaddsubfx-git: zynaddsubfx banks'
)
provides=('carla')
conflicts=('carla' 'carla-git')
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
