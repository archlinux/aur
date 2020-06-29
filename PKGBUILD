# Maintainer: Qirui Wang <wqr.prg@gmail.com>
# Contributor: Carl George < arch at cgtx dot us >

_name="sanic"
pkgname="python-$_name"
pkgver=20.6.3
pkgrel=1
pkgdesc='Async Python 3.6+ web server/framework | Build fast. Run fast.'
arch=("any")
url='https://sanicframework.org/'
license=("MIT")
depends=(
    'python-httptools'
    'python-aiofiles'
    'python-websockets'
    'python-multidict'
    'python-httpx'
    'python-uvloop'
    'python-ujson'
)
makedepends=("python-setuptools")
source=("https://github.com/huge-success/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('d54d590173b8aafba4459e8dc9e2b3bb75a1ab700c56751529776aeaa759916d')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/licence"
}
