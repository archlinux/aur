# Maintainer: John Gerritse <tyrannis dot hawk at gmail dot com>

pkgname=python-pyspellchecker
_pkgname=pyspellchecker
pkgver=0.6.2
pkgrel=2
pkgdesc="Pure python spell checker based on work by Peter Norvig"
arch=('any')
url="https://github.com/barrust/pyspellchecker"
license=('MIT')
depends=('python' 'python-setuptools')
source=(
    ${pkgname}-${pkgver}.tar.gz::https://github.com/barrust/pyspellchecker/archive/v${pkgver}.tar.gz
)
sha256sums=('d3a4314c5f19b2fc3d7b7bc248df75a5343a3604d857e6eeaf318fe1847e8c6e')

build() {
    cd "${_pkgname}-${pkgver}"
    LANG=en_US.UTF-8 python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    LANG=en_US.UTF-8 python setup.py install --root=$pkgdir --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
