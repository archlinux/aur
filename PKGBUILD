# Maintainer: John Dovern <92282293+johndovern@users.noreply.github.com>
pkgname=comicthumb
pkgver=0.0.1
pkgrel=1
pkgdesc="Replacement of the comicthumb utility from comix."
arch=('any')
url="https://codeberg.org/johndovern/comicthumb"
license=('GPL3')
depends=('python')
source=("https://codeberg.org/johndovern/comicthumb/releases/download/0.0.1/$pkgname-$pkgver.tar.gz")
sha256sums=('1023d7c2ba98a3c35d8f7541856e46701c2a1ebe6e031f31b9b43821fb0f37a9')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
