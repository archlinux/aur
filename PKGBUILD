# Maintainer: Qirui Wang <wqr.prg@gmail.com>
# Contributor: Carl George < arch at cgtx dot us >

_name="sanic-routing"
pkgname="python-$_name"
pkgver=0.6.2
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
sha256sums=('0a91dce20165a511d1077be105c3df9a4aed50750b38786ffa39fb1fc6a92d34'
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
