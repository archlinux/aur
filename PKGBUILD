# Maintainer: Olivier Le Moal

pkgname=sdrangel-bin
pkgver=7.17.2
_subver=2401
pkgrel=1
conflicts=(sdrangel-git)
pkgdesc='Qt5/OpenGL SDR and signal analyzer frontend.'
url="https://github.com/f4exb/sdrangel"
arch=('x86_64')
license=('GPL3')

depends=('fftw' 'ffmpeg4.4' 'pulseaudio' 'lz4'
         'qt5-base' 'qt5-multimedia' 'qt5-websockets' 'qt5-location' 'qt5-speech' 'qt5-graphicaleffects' 'qt5-charts')
optdepends=('mbelib: Required for Digital Speech Decoder (DSD) demodulator'
            'dsdcc: Required for Digital Speech Decoder (DSD) demodulator'
	    'codec2: Required for M17 and FreeDV mod/demod'
            'opencv: Required for ATV demodulator'
	    'qt5-webengine: Required for map features'
            'qt5-serialport: Required for GS-232 controller'
            'qt5-gamepad: Required for GS-232 controller'
            'hamlib: Required for Audio CAT SISO plugin'
            'hackrf: HackRF support'
            'libuhd: USRP support'
            'airspy: Airspy support'
	    'libiio: PlutoSDR support'
            'rtl-sdr: Realtek RTL2832U support'
	    'libsdrplay: SDRplay support')
provides=('sdrangel')
source=("https://github.com/f4exb/sdrangel/releases/download/v${pkgver}/sdrangel-${_subver}-master.tar.gz")
sha256sums=('0ee01a52a6bdc5d7c123f431aed9e3b9f7488f44d0fa999828cb06bfe6ebc447')

prepare() {
    cd "sdrangel-${_subver}-master"
    # extract .deb data
    ar p sdrangel_${pkgver}-1_amd64.deb data.tar.zst | tar x --zstd
}

package() {
    cd "sdrangel-${_subver}-master"
    mv "usr/" ${pkgdir}
}

