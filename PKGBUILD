# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Ronuk Raval <ronuk.raval at gmail dot com>

pkgname=python-pscript
pkgver=0.7.4
pkgrel=1
pkgdesc="Python to JavaScript compiler"
arch=('any')
url="https://pscript.readthedocs.io"
license=('BSD')
depends=('python-setuptools')
source=(
    ${pkgname}-${pkgver}.tar.gz::https://github.com/flexxui/pscript/archive/v${pkgver}.tar.gz
)
sha256sums=('8be5c1f83aa81b3cce86e53fe69bb405f2fc70169c26f13aeff39c2e34e5095f')

build() {
    cd "pscript-${pkgver}"
    python setup.py build
}

package() {
    cd "pscript-${pkgver}"
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
