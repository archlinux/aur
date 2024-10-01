# Maintainer: Jax Young <jaxvanyang@gmail.com>
# Maintainer: Murli Tawari <kraanzu@gmail.com>

pkgname=smassh
pkgver=3.1.5
pkgrel=1
pkgdesc="TUI based typing test application inspired by MonkeyType"
url="https://github.com/kraanzu/smassh"
arch=('any')
license=('GPL-3.0-only')
depends=(
        'python>=3.8.1'
        'python-textual>=0.81.0'
        'python-click>=8.1.7'
        'python-requests>=2.31.0'
        'python-platformdirs>=4.3.6'
        'python-rich'
)
makedepends=(
        'python-build'
        'python-installer'
        'python-wheel'
        'python-poetry-core>=1.0.0'
)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha256sums=('677429f19be37c8ef78679bf769282f2057e97c5f7b31e597b5e5af07880bfd8')

build() {
        cd "$pkgname-$pkgver"
        python -m build --wheel --no-isolation
}

package() {
        cd "$pkgname-$pkgver"
        python -m installer --destdir "$pkgdir" dist/*.whl
}
