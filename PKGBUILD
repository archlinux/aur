# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=simplespectral
_pkgname=simplespectral
pkgver=1.0.0
pkgrel=1
pkgdesc="Heavily simplified scipy.signal.spectral module which only depends on NumPy and supports pyFFTW"
arch=('any')
url="https://github.com/xmikos/simplespectral"
license=('MIT')
depends=('python' 'python-numpy')
makedepends=('python-setuptools')
optdepends=(
  'python-pyfftw: fastest FFT calculations with FFTW library'
  'python-scipy: faster FFT calculations with scipy.fftpack library'
)
source=(https://github.com/xmikos/simplespectral/archive/v$pkgver.tar.gz)
sha256sums=('4342741f7054c71f7c5fb9d38df49e048e0a4e20eb53cefd247e47937644cad0')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
