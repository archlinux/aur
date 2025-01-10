# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=pyupgrade
pkgver=3.19.1
pkgrel=1
pkgdesc="A tool to automatically upgrade syntax for newer versions of the language"
arch=('any')
url="https://github.com/asottile/pyupgrade"
license=('MIT')
depends=(python python-tokenize-rt)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('393bf5343e1ca004474d3a0d3e7866fe9a5a9d0a346a375451130c925b9b0a11808e629340d0a1ca69da772ea30f161629974b80cfcbd6e0a3cb086694bb9432')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

