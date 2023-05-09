# Maintainer: Bernardo Gameiro <projects@bgameiro.me>

pkgbase='python-uavro'
pkgname=('python-uavro')
pkgver=0.1.2
pkgrel=1
pkgdesc='Cython-optimized reader for tabular Avro data'
arch=('any')
url='https://github.com/martindurant/uavro/'
license=('Apache')
source=("https://files.pythonhosted.org/packages/source/u/uavro/uavro-$pkgver.tar.gz")
sha256sums=('4c26012b9218ae07e81573958331c24a77e8964556fc768223aae4f11b647cdf')
provides=("$pkgbase=$pkgver")

build() {
  cd "${srcdir}"/uavro-$pkgver
  python setup.py build
} 

package_python-uavro() {
  depends=(
         'python>=3.8.0'
         'python-pandas'
         'python-numpy>=1.11'
         'cython'
         'python-fastparquet')

  cd "${srcdir}"/uavro-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}