# Maintainer: John Dovern <92282293+johndovern@users.noreply.github.com>
pkgname=comicthumb
pkgver=0.0.5
pkgrel=1
pkgdesc="Python3 reimplementation of comix's comicthumb for generating comic thumbnails"
arch=('any')
url="https://codeberg.org/johndovern/comicthumb"
license=('GPL2')
depends=(
    'python'
    'python-pillow'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("https://codeberg.org/johndovern/comicthumb/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=(
    '551e6295387c1618ae5b25d844041500c1bd3c4066215c0303e27ab0906b66fd'
)

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
