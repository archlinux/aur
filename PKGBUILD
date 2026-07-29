# Maintainer: Diaz <muhammaddiaznurfarizki@gmail.com>
pkgname=m3wal
pkgver=1.1.10
pkgrel=2
pkgdesc="Material 3 Color Scheme Generator from Wallpaper"
arch=('any')
url="https://github.com/MDiaznf23/m3wal"
license=('GPL-2.0')
depends=('python' 'python-pillow' 'python-numpy' 'feh' 'python-material-color-utilities-cpp')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('806f480839a1ff72482c6d2f1d392c6e90b2b6e609c902c85f17e31ce0c02ec4')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
