# Maintainer: Raj Jagadeesh A P rajjagadeesh2006@gmail.com
# Contributor: Raj Jagadeesh A P rajjagadeesh2006@gmail.com

pkgname=retroart
pkgver=1.0.0
pkgrel=2
pkgdesc="Convert photos into retro-style pixel art"
arch=('any')
url="https://github.com/Raj-Jagadeesh-A-P/RetroArt"
license=('GPL-3.0-only')
depends=('python' 'python-numpy' 'python-opencv')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Raj-Jagadeesh-A-P/RetroArt/archive/v$pkgver.tar.gz")
sha256sums=('6bb6149bbd15b865d097a89ade8fa77cda0c00ed1a866a5e45ceeff567f7a47a')

build() {
    cd "$srcdir/RetroArt-$pkgver"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/RetroArt-$pkgver"
    /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
}
