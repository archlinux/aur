# Maintainer: John Gerritse <tyrannis dot hawk at gmail dot com>

pkgname=python-pyspellchecker
_pkgname=pyspellchecker
pkgver=0.5.4
pkgrel=1
pkgdesc="Pure python spell checker based on work by Peter Norvig"
arch=('any')
url="https://github.com/barrust/pyspellchecker"
license=('MIT')
depends=('python' 'python-setuptools')
source=(
    ${pkgname}-${pkgver}.tar.gz::https://github.com/barrust/pyspellchecker/archive/v${pkgver}.tar.gz
)
sha256sums=('26172269c1ea76e47d36409b207760f1ba3b986e8e3d942e25d862cab8b0076b')

build() {
    cd "${_pkgname}-${pkgver}"
    LANG=en_US.UTF-8 python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    LANG=en_US.UTF-8 python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
