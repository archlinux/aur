# Maintainer: John Gerritse <tyrannis dot hawk at gmail dot com>

pkgname=python-pyspellchecker
_pkgname=pyspellchecker
pkgver=0.7.0
pkgrel=1
pkgdesc="Pure python spell checker based on work by Peter Norvig"
arch=('any')
url="https://github.com/barrust/pyspellchecker"
license=('MIT')
depends=('python' 'python-setuptools')
source=(
    ${pkgname}-${pkgver}.tar.gz::https://github.com/barrust/pyspellchecker/archive/v${pkgver}.tar.gz
)
sha256sums=('878421257deccfb5f6f7f1902c4ab2ac0a1bb81da8ed1c116af3a4fbac2df2a2')

build() {
    cd "${_pkgname}-${pkgver}"
    LANG=en_US.UTF-8 python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    LANG=en_US.UTF-8 python setup.py install --root=$pkgdir --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
