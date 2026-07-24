# Maintainer: Shiny_Pachirisu <harman-bin@proton.me>
pkgname=iris-colors
pkgver=0.1.1
pkgrel=1
pkgdesc="semantic color scheme generator for linux ricing"
arch=('any')
url="https://github.com/Harman1307/iris"
license=('MIT')
depends=('python' 'python-pillow' 'python-numpy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4aa00afdae88111bf176b7f7375945daea57f33f3a5cf65725f03eeb31d8f901')

build() {
    cd "$srcdir/iris-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/iris-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
