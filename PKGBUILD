# Maintainer: Gary Wang <wzc782970009@gmail.com>

pkgname=qmidiplayer
pkgver=0.8.7
pkgrel=2
pkgdesc='A cross-platform midi file player based on libfluidsynth and Qt.'
arch=('x86_64')
url='https://chrisoft.org/QMidiPlayer/'
license=('GPLv3')
depends=(
    'qt5-base' 'qt5-quickcontrols'
    'rtmidi' 'fluidsynth'
    'freetype2' 'zlib' 'libjpeg-turbo' 'libpng'
    'glfw' 'glew' 'openal' 'devil'
)
makedepends=(
    'git'
    'cmake'
)
source=(
    "${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/chirs241097/QMidiPlayer/archive/${pkgver}-${pkgrel}.tar.gz"
	"smelt-gd572329.zip::https://github.com/BearKidsTeam/SMELT/archive/d57232938d0c538922154e9223bf994e78c6b069.zip"
)
md5sums=(
    'SKIP'
    'SKIP'
)

#prepare() {
#}

build () {
	cp -r ${srcdir}/SMELT-d57232938d0c538922154e9223bf994e78c6b069/* ${srcdir}/QMidiPlayer-0.8.7-2/visualization/SMELT
    cd ${srcdir}/QMidiPlayer-0.8.7-2
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
    make -j`nproc`
}

package() {
    make -C ${srcdir}/QMidiPlayer-0.8.7-2 DESTDIR="$pkgdir" install
}
