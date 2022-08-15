# Maintainer: Qirui Wang <wqr.prg@gmail.com>
# Contributor: Carl George < arch at cgtx dot us >

_name="sanic"
pkgname="python-$_name"
pkgver=22.6.2
pkgrel=1
pkgdesc='Async Python 3.6+ web server/framework | Build fast. Run fast.'
arch=("any")
url='https://sanic.dev/'
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
sha256sums=('7685110e64f4a73fd45ccd84f0ecab31ddf4cb3c3aa3cc5a4ba57d55921b82e9')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/licence"
}
