# Maintainer: Olivier Le Moal

pkgname=sdrangel-bin
pkgver=6.17.6
_subver=1220
pkgrel=3
conflicts=(sdrangel-git)
pkgdesc='Qt5/OpenGL SDR and signal analyzer frontend.'
url="https://github.com/f4exb/sdrangel"
arch=('x86_64')
license=('GPL3')

depends=('fftw' 'ffmpeg' 'pulseaudio' 'lz4'
         'qt5-base' 'qt5-multimedia' 'qt5-websockets' 'qt5-location' 'qt5-speech' 'qt5-graphicaleffects')
optdepends=('mbelib: Required for Digital Speech Decoder (DSD) demodulator'
            'opencv: Required for ATV demodulator'
            'qt5-serialport: Required for GS-232 controller')
provides=('sdrangel')
source=("https://github.com/f4exb/sdrangel/releases/download/v${pkgver}/sdrangel-${_subver}-master.tar.gz")
sha256sums=('9ad5cf83219bc2cb3d33d79598b5a41af3ffd63d1399f116403493c31e30cf43')

prepare() {
    cd "sdrangel-${_subver}-master"
    # extract .deb data
    ar p sdrangel_${pkgver}-1_amd64.deb data.tar.xz | tar xJ
}

package() {
    cd "sdrangel-${_subver}-master"
    mv "usr/" ${pkgdir}
}

