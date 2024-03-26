# Maintainer: Jax Young <jaxvanyang@gmail.com>
# Maintainer: Murli Tawari <kraanzu@gmail.com>

pkgname=smassh
pkgver=3.1.3
pkgrel=2
pkgdesc="TUI based typing test application inspired by MonkeyType"
url="https://github.com/kraanzu/smassh"
arch=('any')
license=('GPL-3.0-only')
depends=(
        'python>=3.8'
        'python-textual>=0.52.1'
        'python-appdirs>=1.4.4'
        'python-click>=8.1.7'
        'python-requests>=2.31.0'
)
makedepends=(
        'python-build'
        'python-installer'
        'python-wheel'
        'python-poetry-core>=1.0.0'
)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha256sums=('e75ff7317bf96ab68010200d9125c50179f5c740a638fee874dc4aac2238f4e7')

build() {
        cd "$pkgname-$pkgver"
        python -m build --wheel --no-isolation
}

package() {
        cd "$pkgname-$pkgver"
        python -m installer --destdir "$pkgdir" dist/*.whl
}
