# Maintainer: Jayson Reis <santosdosreis@gmail.com>
pkgname=python-configupdater
pkgver=3.0.1
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
sha256sums=('372a6a6ef598a118ec17927bec9486a7d36f44ccd3e641e879e0bf998b70924e')

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
