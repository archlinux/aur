# Maintainer: Qirui Wang <wqr.prg@gmail.com>
# Contributor: Carl George < arch at cgtx dot us >

_name="sanic"
pkgname="python-$_name"
pkgver=21.3.2
pkgrel=1
pkgdesc='Async Python 3.6+ web server/framework | Build fast. Run fast.'
arch=("any")
url='https://sanicframework.org/'
license=("MIT")
depends=(
    'python-sanic-routing'
    'python-httptools'
    'python-aiofiles'
    'python-websockets'
    'python-multidict'
    'python-uvloop'
    'python-ujson'
)
makedepends=("python-setuptools")
source=("https://github.com/sanic-org/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('1d1f9994780b707e179066bbaa2cdb3c44f94b68e55c398fdf706fb549f3be22')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/licence"
}
