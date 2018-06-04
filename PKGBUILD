# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgname=qspectrumanalyzer
pkgver=2.2.0
pkgrel=1
pkgdesc="Spectrum analyzer for multiple SDR platforms (PyQtGraph based GUI for soapy_power, rx_power, rtl_power, hackrf_sweep and other backends)"
arch=('any')
url="https://github.com/xmikos/qspectrumanalyzer"
license=('GPL3')
depends=('python-qt.py' 'python-pyqt5' 'python-pyqtgraph' 'soapy_power>=1.5.0' 'swig')
makedepends=('python-setuptools')
optdepends=(
  'rtl_power_fftw-git: alternative RTL-SDR backend using FFTW library (much faster than rtl_power)'
  'rtl-sdr-keenerd-git: better version of rtl_power backend'
  'rtl-sdr: original rtl_power backend (slightly broken, use rtl-sdr-keenerd-git instead)'
  'rx_tools: rx_power backend (universal SoapySDR based backend, but seems slow and buggy)'
  'hackrf: hackrf_sweep backend (wideband spectrum monitoring with sweep rate of 8 GHz/s)'
)
source=(https://github.com/xmikos/qspectrumanalyzer/archive/v$pkgver.tar.gz)
sha256sums=('d50e13fa4951a67ed4f56362fb74daff9faeda88d7fc3f9d98cffb8d63c6311d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"
}
