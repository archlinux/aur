# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
_pkgname=translation-finder
pkgname=python-translation-finder
pkgver=2.5
pkgrel=1
pkgdesc="Translation file finder used by weblate"
url="https://github.com/WeblateOrg/translation-finder"
depends=('python' 'python-ruamel-yaml' 'python-weblate-language-data')
checkdepends=('python-pytest')
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=("https://github.com/WeblateOrg/translation-finder/archive/${pkgver}.tar.gz")

sha256sums=('dfd910ad97054dace0ee69dd7fca7ac6cbafed6c8dc1dbcc65215ba517879a07')

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
