# Maintainer: Olivier Le Moal

pkgname=sdrangel-bin
pkgver=7.8.6
_subver=1939
pkgrel=2
conflicts=(sdrangel-git)
pkgdesc='Qt5/OpenGL SDR and signal analyzer frontend.'
url="https://github.com/f4exb/sdrangel"
arch=('x86_64')
license=('GPL3')

depends=('fftw' 'ffmpeg4.4' 'pulseaudio' 'lz4'
         'qt5-base' 'qt5-multimedia' 'qt5-websockets' 'qt5-location' 'qt5-speech' 'qt5-graphicaleffects' 'qt5-charts')
optdepends=('mbelib: Required for Digital Speech Decoder (DSD) demodulator'
            'dsdcc: Required for Digital Speech Decoder (DSD) demodulator'
            'opencv: Required for ATV demodulator'
	    'qt5-webengine: Required for map features'
            'qt5-serialport: Required for GS-232 controller'
            'hackrf: HackRF support'
            'libuhd: USRP support'
            'airspy: Airspy support'
	    'soapyplutosdr: Soapy SDR support'
            'rtl-sdr: Realtek RTL2832U support'
	    'libsdrplay: SDRplay support')
provides=('sdrangel')
source=("https://github.com/f4exb/sdrangel/releases/download/v${pkgver}/sdrangel-${_subver}-master.tar.gz")
sha256sums=('ee64696944639eb31714842d3fdb0017046d74dfee45b24d296e67cf9b6e825b')

prepare() {
    cd "sdrangel-${_subver}-master"
    # extract .deb data
    ar p sdrangel_${pkgver}-1_amd64.deb data.tar.zst | tar x --zstd
}

package() {
    cd "sdrangel-${_subver}-master"
    mv "usr/" ${pkgdir}
}

