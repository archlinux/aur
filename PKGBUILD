# Maintainer: Austin Keller <https://aur.archlinux.org/account/akeller>

pkgname=python-pydrive2
_module='PyDrive2'
pkgver=1.9.1
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
sha256sums=('4f4f61b59ca63c3840b93a753b352fc4fdcdb5a3aa7a130279c27752131db6d1')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
