# Maintainer: El-Mundos <taber.nandez.sergio@gmail.com>
pkgname=paraninfodl
pkgver=1.1.1
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
sha256sums=('e804b1a6c79e6ec97c48fbf8d9970da63841a0233e4c801ab7ecfe4829a5db42')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
