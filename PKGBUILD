# Maintainer: Miodrag Tokić

pkgname=python-sqlglot
pkgver=11.4.2
pkgrel=1
pkgdesc='An easily customizable SQL parser and transpiler'
arch=('any')
url='https://github.com/tobymao/sqlglot'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/tobymao/sqlglot/archive/v${pkgver}.tar.gz")
sha256sums=('79f913c22570f76753493810bdd0d4b8817f3ea4d2d905d04dd3ce854a5d4527')

build() {
    cd "$srcdir/sqlglot-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/sqlglot-${pkgver}"
    install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python setup.py install --root="$pkgdir" --optimize=1
}
