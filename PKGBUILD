# Maintainer: Bernardo Gameiro <projects@bgameiro.me>

extension='avro'
pkgbase='python-intake-avro'
pkgname=('python-intake-avro')
pkgver=0.2.1 
pkgrel=1
pkgdesc='avro extension for intake'
arch=('any')
url='https://github.com/intake/intake-avro'
license=('BSD')
source=("https://files.pythonhosted.org/packages/source/i/intake-avro/intake-avro-$pkgver.tar.gz")
sha256sums=('741196488f0bc92b4d269a11f5d8fb502ff93d9eafde98d732ec7cd3a9e0daf3')
provides=("$pkgbase=$pkgver")

build() {
  cd "${srcdir}"/intake-$extension-$pkgver
  python setup.py build
} 

package_python-intake-avro() {
  depends=(
         'python>=3.8.0'
         'python-intake'
         'python-dask'
         'python-pandas'
         'python-fastavro'
	       'python-uavro')

  cd "${srcdir}"/intake-avro-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}