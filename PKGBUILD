# Maintainer: Olivier Le Moal

pkgname=sdrangel-bin
pkgver=7.10.0
_subver=1984
pkgrel=4
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
	    'libiio: PlutoSDR support'
            'rtl-sdr: Realtek RTL2832U support'
	    'libsdrplay: SDRplay support')
provides=('sdrangel')
source=("https://github.com/f4exb/sdrangel/releases/download/v${pkgver}/sdrangel-${_subver}-master.tar.gz")
sha256sums=('104e2780ab8e82657fd01bfe5f5619fb63ef3c51afbb3eeb6d9d33453b0b1ef6')

prepare() {
    cd "sdrangel-${_subver}-master"
    # extract .deb data
    ar p sdrangel_${pkgver}-1_amd64.deb data.tar.zst | tar x --zstd
}

package() {
    cd "sdrangel-${_subver}-master"
    mv "usr/" ${pkgdir}
}

