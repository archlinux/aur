# Maintainer: John Dovern <92282293+johndovern@users.noreply.github.com>
pkgname=comicthumb
pkgver=0.0.3
pkgrel=1
pkgdesc="Replacement of the comicthumb utility from comix."
arch=('any')
url="https://codeberg.org/johndovern/comicthumb"
license=('GPL3')
depends=('python' 'python-pillow')
makedepends=('python-build' 'python-installer')
source=("https://codeberg.org/johndovern/comicthumb/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=(
    'fa1d93f74c78fd6222099b838b6ad099b55ce12d2715fa1f9b565b5339c17742'
)

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
