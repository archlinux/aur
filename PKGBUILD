# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
_pkgname=translation-finder
pkgname=python-translation-finder
pkgver=2.9
pkgrel=1
pkgdesc="Translation file finder used by weblate"
url="https://github.com/WeblateOrg/translation-finder"
depends=('python' 'python-ruamel-yaml' 'python-weblate-language-data')
checkdepends=('python-pytest')
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=("https://github.com/WeblateOrg/translation-finder/archive/${pkgver}.tar.gz")

sha256sums=('c069e05b9f2dcf6faf3294846de9bd9ea0011be662e0135f2dc119704875a41b')

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
