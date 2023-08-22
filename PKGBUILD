# Maintainer: Miodrag Tokić

pkgname=python-sqlglot
pkgver=17.0.0
pkgrel=1
pkgdesc='An easily customizable SQL parser and transpiler'
arch=('any')
url='https://github.com/tobymao/sqlglot'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/tobymao/sqlglot/archive/v${pkgver}.tar.gz")
sha256sums=('bf6a3f98902f31389f274eee726537892f4fa14ad4e03c0a36f01569e931171f')

build() {
    cd "$srcdir/sqlglot-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/sqlglot-${pkgver}"
    install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python setup.py install --root="$pkgdir" --optimize=1
}
