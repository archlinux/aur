# Maintainer: Olivier Le Moal

pkgname=sdrangel-bin
pkgver=4.14.17
_subver=207
pkgrel=1
conflicts=(sdrangel-git)
pkgdesc="Qt5/OpenGL SDR and signal analyzer frontend."
url="https://github.com/f4exb/sdrangel"
arch=('x86_64')
license=('GPL3')

depends=('pkg-config' 'log4cpp' 'opencv' 'fftw' 'ffmpeg'
         'cm256cc' 'dsdcc' 'pulseaudio' 'lz4' 'nanomsg'
         'qt5-base' 'qt5-tools' 'qt5-multimedia' 'qt5-websockets')
optdepends=('ffmpeg: DATV demodulator')
provides=("sdrangel")
source=("https://github.com/f4exb/sdrangel/releases/download/v${pkgver}/sdrangel-${_subver}-master.tar.gz")
sha256sums=('ebc18df8761edb380189a7ace5c11c16f5ff145830e8fcd17bec5c19c5a695d9')

prepare() {
    cd "sdrangel-${_subver}-master"
    # extract .deb data
    ar p sdrangel_${pkgver}-1_amd64.deb data.tar.xz | tar xJ
}

package() {
    cd "sdrangel-${_subver}-master"
    mv "usr/" ${pkgdir}
}

