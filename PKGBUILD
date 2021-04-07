# Maintainer: Qirui Wang <wqr.prg@gmail.com>
# Contributor: Carl George < arch at cgtx dot us >

_name="sanic-routing"
pkgname="python-$_name"
pkgver=0.5.2
pkgrel=1
pkgdesc='Internal handler routing for Sanic beginning with v21.3.'
arch=("any")
url='https://sanicframework.org/'
license=("MIT")
makedepends=("python-setuptools")
source=(
    "https://github.com/sanic-org/${_name}/archive/v${pkgver}.tar.gz"
    "https://github.com/sanic-org/sanic/raw/v21.3.2/LICENSE"
)
sha256sums=('311d5f03b472fc89384c8baaf985b6264fd02428d4b2b5e8378f18e16329f16c'
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
