# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
_pkgname=translation-finder
pkgname=python-translation-finder
pkgver=2.1
pkgrel=1
pkgdesc="Translation file finder used by weblate"
url="https://github.com/WeblateOrg/translation-finder"
depends=('python' 'python-chardet' 'python-ruamel-yaml')
checkdepends=('python-pytest')
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=("https://github.com/WeblateOrg/translation-finder/archive/${pkgver}.tar.gz")

sha256sums=('ebc1c6a3dee0457a087fb11b7f19abc782fde41a23dc967f5f0d8359063aafa2')

check() {
    pytest
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}


