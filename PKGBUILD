# Maintainer: Austin Keller <https://aur.archlinux.org/account/akeller>

pkgname=python-pydrive2
_module='PyDrive2'
pkgver=1.8.2
pkgrel=1
pkgdesc="Google Drive API made easy. Maintained fork of PyDrive."
url="https://github.com/iterative/PyDrive2"
depends=(
    'python-google-api-python-client'
    'python-six'
    'python-oauth2client'
    'python-pyaml'
    'python-pyopenssl'
)
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("${_module}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6d8ca3084e4f2269d9eac9d94ad89949f8c1f7bd59f73d587d1b1ac9f29eb90e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
