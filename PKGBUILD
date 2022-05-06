# Maintainer: Jayson Reis <santosdosreis@gmail.com>
pkgname=python-configupdater
pkgver=3.1
pkgrel=1
pkgdesc="Parser like ConfigParser but for updating configuration files"
arch=('any')
url="https://github.com/pyscaffold/configupdater"
license=('MIT')
makedepends=(
  'python-setuptools'
)
checkdepends=(
  'python-pytest'
  'python-pytest-cov'
)
depends=(
  'python'
)
_name="ConfigUpdater"
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=('ddcc5250f508b9131c45fd1dbceae3f112907ddd7597da1cff30c51bf7c87edb')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  PYTHONPATH=src/ py.test .
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
