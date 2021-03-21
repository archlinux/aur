# Maintainer: Qirui Wang <wqr.prg@gmail.com>
# Contributor: Carl George < arch at cgtx dot us >

_name="sanic-router"
pkgname="python-sanic-routing"
pkgver=0.4.0
pkgrel=1
pkgdesc='Internal handler routing for Sanic beginning with v21.3.'
arch=("any")
url='https://sanicframework.org/'
license=("MIT")
makedepends=("python-setuptools")
source=(
    "https://github.com/sanic-org/${_name}/archive/v${pkgver}.tar.gz"
    "https://github.com/sanic-org/sanic/raw/v21.3.1/LICENSE"
)
sha256sums=('47c578b25c05f6b02c84d7b650ef5004199908b8bafe7da1e46a6cbf662ee53e'
            'cdc294c495a8d80f3fb596f257fb7b61214c7d5e5ee254852b753ff81e8e137c')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/licence"
}
