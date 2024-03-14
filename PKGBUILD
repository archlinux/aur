# Maintainer: John Dovern <92282293+johndovern@users.noreply.github.com>
pkgname=comicthumb
pkgver=0.0.2
pkgrel=1
pkgdesc="Replacement of the comicthumb utility from comix."
arch=('any')
url="https://codeberg.org/johndovern/comicthumb"
license=('GPL3')
depends=('python')
source=("https://codeberg.org/johndovern/comicthumb/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('08fe737b0bb6d4d1ef9dec8356eb513d91a691edff7ce247f80f604151cac462')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
