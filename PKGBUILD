# Maintainer: Miodrag Tokić

pkgname=python-sqlglot
pkgver=11.1.3
pkgrel=1
pkgdesc='An easily customizable SQL parser and transpiler'
arch=('any')
url='https://github.com/tobymao/sqlglot'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/tobymao/sqlglot/archive/v${pkgver}.tar.gz")
sha256sums=('a35fb1f3ff13586fc35cb86ed2a9491457426c5f114f32dfb2d0f228a6bfdc8d')

build() {
    cd "$srcdir/sqlglot-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/sqlglot-${pkgver}"
    install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python setup.py install --root="$pkgdir" --optimize=1
}
