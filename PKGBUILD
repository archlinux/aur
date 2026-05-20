# Maintainer: El-Mundos <taber.nandez.sergio@gmail.com>
pkgname=paraninfodl
pkgver=1.1.2
pkgrel=1
pkgdesc="Download ebooks from ebooks.paraninfo.es as PDF"
arch=('any')
url="https://github.com/El-Mundos/paraninfodl"
license=('MIT')
depends=(
    'python'
    'python-playwright'
    'python-cryptography'
    'python-pypdf'
    'python-reportlab'
    'python-pillow'
    'python-requests'
    'img2pdf'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/El-Mundos/paraninfodl/archive/v$pkgver.tar.gz")
sha256sums=('3b8b004c1390e7de4cb3e62935d860a19ca21e44d041a3ed83c34982ad71da53')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
