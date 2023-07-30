# Maintainer: Andrej Halveland (SnipeX_ / SnipeX) <andrej.halv@gmail.com>

pkgname=python-pwinput
pkgver=1.0.3
pkgrel=1
pkgdesc="A cross-platform Python module that displays **** for password input."
arch=('any')
url="https://github.com/asweigart/pwinput"
license=('MIT')
depends=(
  'python'
)
makedepends=(
  'python-setuptools'
  'python-build'
  'python-wheel'
  'python-installer'
)

source=("https://files.pythonhosted.org/packages/source/p/pwinput/pwinput-${pkgver}.tar.gz")
md5sums=('7d2b48529556b00b90eae2aed96a79d9')

build() {
  cd "${srcdir}/pwinput-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/pwinput-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
