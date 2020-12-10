# Maintainer: Olivier Le Moal

pkgname=sdrangel-bin
pkgver=6.3.0
_subver=613
pkgrel=2
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
sha256sums=('8fa53357dc8022a3e7ee9e3b117dc3af51f20e750eb2aac4bd9383367978d0ae')

prepare() {
    cd "sdrangel-${_subver}-master"
    # extract .deb data
    ar p sdrangel_${pkgver}-1_amd64.deb data.tar.xz | tar xJ
}

package() {
    cd "sdrangel-${_subver}-master"
    mv "usr/" ${pkgdir}
}

