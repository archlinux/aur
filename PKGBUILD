# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-ivi
pkgver=0.14.9
pkgrel=1
pkgdesc="Python Interchangeable Virtual Instrument Library"
arch=('any')
url="https://github.com/python-ivi/python-ivi"
license=('MIT')
depends=('python' 'python-numpy')
optdepends=(
  'python-vxi11: VXI11 instrument support'
  'python-usbtmc: USBTMC instrument support'
  'python-pyvisa: PyVISA interface for NI drivers'
)

source=("python-ivi-$pkgver.tar.gz::https://github.com/python-ivi/python-ivi/archive/v$pkgver.tar.gz")
md5sums=('86d4e627d9cb328bb11b1d836b68baee')

build() {
  cd "$srcdir/python-ivi-$pkgver"
}

package() {
  cd "$srcdir/python-ivi-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

