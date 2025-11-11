# Maintainer: PVK praneethvarmakopperla@gmail.com

pkgname=noxboot
pkgver=0.1.0
pkgrel=1
pkgdesc="Smart Startup Manager CLI for Linux — manage autostart apps easily"
arch=('any')
url="https://github.com/pvk-96/noxboot"
license=('MIT')
depends=('python' 'python-typer' 'python-rich' 'python-psutil' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pvk-96/noxboot/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
