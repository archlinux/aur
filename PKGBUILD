# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=qspectrumanalyzer
pkgver=1.4.0
pkgrel=1
pkgdesc="Spectrum analyzer for RTL-SDR (GUI for rtl_power based on PyQtGraph)"
arch=('any')
url="https://github.com/xmikos/qspectrumanalyzer"
license=('GPL3')
depends=('python-pyqt4' 'python-pyqtgraph' 'rtl-sdr')
makedepends=('python-setuptools')
optdepends=('rtl_power_fftw-git: alternative rtl_power implementation using FFTW library')
source=(https://github.com/xmikos/qspectrumanalyzer/archive/v$pkgver.tar.gz)
sha256sums=('e5f91b7e96422a99423151a4df2dc4bd92eef42f65c6e3ea1df0a80a1edf9a66')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
