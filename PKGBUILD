# Maintainer: Olivier Le Moal

pkgname=sdrangel-bin
pkgver=6.5.4
_subver=680
pkgrel=1
conflicts=(sdrangel-git)
pkgdesc="Qt5/OpenGL SDR and signal analyzer frontend."
url="https://github.com/f4exb/sdrangel"
arch=('x86_64')
license=('GPL3')

depends=('fftw' 'ffmpeg' 'pulseaudio' 'lz4'
         'qt5-base' 'qt5-multimedia' 'qt5-websockets')
optdepends=('mbelib: Required for Digital Speech Decoder (DSD) demodulator'
            'opencv: Required for ATV demodulator'
            'qt5-serialport: Required for  GS-232 controller')
provides=("sdrangel")
source=("https://github.com/f4exb/sdrangel/releases/download/v${pkgver}/sdrangel-${_subver}-master.tar.gz")
sha256sums=('18b553c4c28cd84ca662f1bc5052a84f3a4bb07644c0c2aa5582d7cc09022495')

prepare() {
    cd "sdrangel-${_subver}-master"
    # extract .deb data
    ar p sdrangel_${pkgver}-1_amd64.deb data.tar.xz | tar xJ
}

package() {
    cd "sdrangel-${_subver}-master"
    mv "usr/" ${pkgdir}
}

