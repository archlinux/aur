# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Olivier Le Moal

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=sdrangel-bin
pkgver=7.22.7
pkgrel=1
conflicts=(sdrangel-git)
pkgdesc='Qt5/OpenGL SDR and signal analyzer frontend.'
url="https://github.com/f4exb/sdrangel"
arch=('x86_64')
license=('GPL-3.0-only')
depends=('fftw' 'ffmpeg4.4' 'lz4' 'qt5-base' 'qt5-multimedia' 'qt5-websockets' 'qt5-location' 'qt5-speech' 'qt5-graphicaleffects' 'qt5-charts')
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
source=(https://github.com/f4exb/sdrangel/releases/download/v${pkgver}/sdrangel_${pkgver}_ubuntu-24.04_amd64.deb)
sha256sums=('bf094fe0730296594d605e9d6c880b1b5e3fd1176e83808663626ac5a904477e')

prepare() {
  mkdir -p "${srcdir}"/sdrangel-${pkgver}
  cd "${srcdir}"/sdrangel-${pkgver}
  ar p "${srcdir}"/sdrangel_${pkgver}_ubuntu-24.04_amd64.deb data.tar.zst | tar x --zstd
}

package() {
  cd "${srcdir}"/sdrangel-${pkgver}
  mv usr "${pkgdir}"
}

