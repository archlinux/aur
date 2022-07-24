# Maintainer: Olivier Le Moal

pkgname=sdrangel-bin
pkgver=7.6.0
_subver=1592
pkgrel=1
conflicts=(sdrangel-git)
pkgdesc='Qt5/OpenGL SDR and signal analyzer frontend.'
url="https://github.com/f4exb/sdrangel"
arch=('x86_64')
license=('GPL3')

depends=('fftw' 'ffmpeg' 'pulseaudio' 'lz4'
         'qt5-base' 'qt5-multimedia' 'qt5-websockets' 'qt5-location' 'qt5-speech' 'qt5-graphicaleffects' 'qt5-charts')
optdepends=('mbelib: Required for Digital Speech Decoder (DSD) demodulator'
            'opencv: Required for ATV demodulator'
	    'qt5-webengine: Required for map features'
            'qt5-serialport: Required for GS-232 controller'
            'hackrf: HackRF support'
            'libuhd: USRP support'
	    'libsdrplay: SDRplay support')
provides=('sdrangel')
source=("https://github.com/f4exb/sdrangel/releases/download/v${pkgver}/sdrangel-${_subver}-master.tar.gz")
sha256sums=('17f2e7ca3073d950ba5e77edc5cd751605979bb248fb3b3f8af4928e70ff4ac8')

prepare() {
    cd "sdrangel-${_subver}-master"
    # extract .deb data
    ar p sdrangel_${pkgver}-1_amd64.deb data.tar.xz | tar xJ
}

package() {
    cd "sdrangel-${_subver}-master"
    mv "usr/" ${pkgdir}
}

