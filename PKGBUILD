# Maintainer: Diaz <muhammaddiaznurfarizki@gmail.com>
pkgname=warnaza
pkgver=1.0.1
pkgrel=1
pkgdesc="Pure pixel color extraction from wallpaper for Linux desktop theming"
arch=('any')
url="https://github.com/MDiaznf23/warnaza"
license=('MIT')
depends=('python' 'python-pillow' 'python-numpy' 'feh')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/w/warnaza/warnaza-$pkgver.tar.gz")
sha256sums=('67c925e648efa0c4185cc4987cd6d74836a4428281ec3667d23c4f824e478f9c')

build() {
    cd "warnaza-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "warnaza-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
