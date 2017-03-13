# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=soapy_power
pkgver=1.2.0
pkgrel=1
pkgdesc="Obtain power spectrum from SoapySDR devices (RTL-SDR, Airspy, SDRplay, HackRF, bladeRF, USRP, LimeSDR, etc.)"
arch=('any')
url="https://github.com/xmikos/soapy_power"
license=('MIT')
depends=('python' 'simplesoapy')
makedepends=('python-setuptools')
optdepends=(
  'soapyrtlsdr-git: support for RTL-SDR (RTL2832U) dongles'
  'soapyairspy-git: support for Airspy R2 and Airspy Mini'
  'soapysdrplay-git: support for SDRplay RSP'
  'soapyhackrf-git: support for HackRF'
  'soapybladerf-git: support for Nuand bladeRF'
  'soapyuhd-git: support for Ettus USRP'
  'soapylms7-git: support for LimeSDR and other LMS7002M based Myriad RF boards'
  'soapyredpitaya-git: support for Red Pitaya'
  'soapyosmo-git: support for MiriSDR and RFSpace'
  'soapyremote-git: use any SoapySDR device remotely over network'
  'python-pyfftw: faster FFT calculations with FFTW library'
)
source=(https://github.com/xmikos/soapy_power/archive/v$pkgver.tar.gz)
sha256sums=('bf292e9b5d0e56fb1178a07b005872dbb56a298c4e34bb14afdf93ea0dc922f6')

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
