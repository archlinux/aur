pkgname=python-pythonfmu
pkgver=0.7.0
pkgrel=1
pkgdesc="packaging of Python3.x code as co-simulation FMUs"
url="https://github.com/NTNU-IHB/PythonFMU"
arch=(x86_64)
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'cmake')
source=("https://github.com/NTNU-IHB/PythonFMU/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('4bf2ef30f7a4b7924b5ab3e2cfc9fabf')

build() {
  cd "${srcdir}"/PythonFMU-$pkgver
  cmake -B build_cmake -DCMAKE_BUILD_TYPE=Release .
  cmake --build build_cmake
  python setup.py build
}

package() {
  cd "${srcdir}"/PythonFMU-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1
}
