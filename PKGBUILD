# Maintainer: kraanzu <kraanzu@gmail.com>
# Maintainer: Jax Young <jaxvanyang@gmail.com>

pkgname=dooit-extras
pkgver=0.2.0
pkgrel=1
pkgdesc="A collection of utilities to customize your dooit!"
url="https://github.com/dooit-org/dooit-extras"
arch=('any')
license=('MIT')
depends=(
    'python>=3.9'
    'dooit>=3.0.4'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-poetry-core>=1.0.0'
)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha256sums=('0d9fbdff03b1b41b51106e0887da7dceea8e339435a00e71d7327d7cf4423a0c')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir "$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
