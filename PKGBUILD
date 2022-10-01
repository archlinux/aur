pkgname=python-pythonfmu
pkgver=0.6.2
pkgrel=1
pkgdesc="packaging of Python3.x code as co-simulation FMUs"
url="https://github.com/NTNU-IHB/PythonFMU"
arch=(any)
license=('MIT')
depends=('python-fmpy')
makedepends=('python-setuptools')
source=("https://github.com/NTNU-IHB/PythonFMU/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('1193be306ea231dd0786d72037d0669b')

build() {
  cd "${srcdir}"/PythonFMU-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}"/PythonFMU-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1
}
