# Maintainer: kraanzu <kraanzu@gmail.com>
# Maintainer: Jax Young <jaxvanyang@gmail.com>

pkgname=dooit-extras
pkgver=0.1.0
pkgrel=1
pkgdesc="A collection of utilities to customize your dooit!"
url="https://github.com/dooit-org/dooit-extras"
arch=('any')
license=('MIT')
depends=(
    'python>=3.9'
    'dooit>=3.0.1'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-poetry-core>=1.0.0'
)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha256sums=('752a4e9562f2ddfe77ae93f46f795e0c850ecdd356d3f7b6b7fd76871b6dc63b')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir "$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
