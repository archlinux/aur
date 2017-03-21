# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=soapy_power
pkgver=1.5.0
pkgrel=1
pkgdesc="Obtain power spectrum from SoapySDR devices (RTL-SDR, Airspy, SDRplay, HackRF, bladeRF, USRP, LimeSDR, etc.)"
arch=('any')
url="https://github.com/xmikos/soapy_power"
license=('MIT')
depends=('python' 'python-numpy' 'simplesoapy>=1.3.0' 'simplespectral')
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
  'python-pyfftw: fastest FFT calculations with FFTW library'
  'python-scipy: faster FFT calculations with scipy.fftpack library'
)
source=(https://github.com/xmikos/soapy_power/archive/v$pkgver.tar.gz)
sha256sums=('c4022c2148bb7bbf4f3e9c6950bdd221ae778dfef6b7d334202d24cf59d524c8')

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
