# Maintainer: John Dovern <92282293+johndovern@users.noreply.github.com>
pkgname=comicthumb
pkgver=0.0.4
pkgrel=1
pkgdesc="Python3 reimplementation of comix's comicthumb for generating comic thumbnails"
arch=('any')
url="https://codeberg.org/johndovern/comicthumb"
license=('GPL3')
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
    '52d78eb4441283c705899b070652159788c8985af379374ec0df4d9f6e272a67'
)

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
