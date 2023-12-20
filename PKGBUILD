# Maintainer: Miodrag Tokić

pkgname=python-sqlglot
pkgver=18.14.0
pkgrel=1
pkgdesc='An easily customizable SQL parser and transpiler'
arch=('any')
url='https://github.com/tobymao/sqlglot'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/tobymao/sqlglot/archive/v${pkgver}.tar.gz")
sha256sums=('bb0d7665005a2ceeeea0b32a4469bd57b57b0bced85d42e35a44c891356b1a6e')

build() {
    cd "$srcdir/sqlglot-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/sqlglot-${pkgver}"
    install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python setup.py install --root="$pkgdir" --optimize=1
}
