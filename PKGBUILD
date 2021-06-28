# Maintainer: Qirui Wang <wqr.prg@gmail.com>
# Contributor: Carl George < arch at cgtx dot us >

_name="sanic-routing"
pkgname="python-$_name"
pkgver=0.7.0
pkgrel=1
pkgdesc='Internal handler routing for Sanic beginning with v21.3.'
arch=("any")
url='https://sanicframework.org/'
license=("MIT")
makedepends=("python-setuptools")
source=(
    "https://github.com/sanic-org/${_name}/archive/v${pkgver}.tar.gz"
    "https://github.com/sanic-org/sanic/raw/v21.6.0/LICENSE"
)
sha256sums=('f61735790124b10b66e034f5f3c8b80b3aeb131e04339ecc5161b90a23883af4'
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
