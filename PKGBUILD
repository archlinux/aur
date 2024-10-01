# Maintainer: Jax Young <jaxvanyang@gmail.com>
# Maintainer: Murli Tawari <kraanzu@gmail.com>

pkgname=smassh
pkgver=3.1.6
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
sha256sums=('d20535c2324cff24bfe0cd5259640bb8b07eef421be1bd1a1a24514664d2c14e')

build() {
        cd "$pkgname-$pkgver"
        python -m build --wheel --no-isolation
}

package() {
        cd "$pkgname-$pkgver"
        python -m installer --destdir "$pkgdir" dist/*.whl
}
