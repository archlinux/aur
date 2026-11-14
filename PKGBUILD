# Maintainer: Diaz <muhammaddiaznurfarizki@gmail.com>
pkgname=warnaza
pkgver=1.0.2
pkgrel=1
pkgdesc="Pure pixel color extraction from wallpaper for Linux desktop theming"
arch=('any')
url="https://github.com/MDiaznf23/warnaza"
license=('MIT')
depends=('python' 'python-pillow' 'python-numpy' 'feh')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/w/warnaza/warnaza-$pkgver.tar.gz")
sha256sums=('2e6e65e2bd1a44e71a84c52e94279aa26470a37a15b45546b9ed3de41060fd35')

build() {
    cd "warnaza-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "warnaza-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
