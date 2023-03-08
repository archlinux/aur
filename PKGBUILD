# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
_pkgname=translation-finder
pkgname=python-translation-finder
pkgver=2.15
pkgrel=1
pkgdesc="Translation file finder used by weblate"
url="https://github.com/WeblateOrg/translation-finder"
depends=('python' 'python-ruamel-yaml' 'python-weblate-language-data' 'python-charset-normalizer')
checkdepends=('python-pytest')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
license=('GPL3')
arch=('any')
source=("https://github.com/WeblateOrg/translation-finder/archive/${pkgver}.tar.gz")

sha256sums=('270b900a1e4ecc29f7ec1f204bb00ba13abd887ac7f8e653ec86e401b653c76d')

check() {
    pytest
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
