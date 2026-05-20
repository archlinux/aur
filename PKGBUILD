# Maintainer: El-Mundos <taber.nandez.sergio@gmail.com>
pkgname=paraninfodl
pkgver=1.2.0
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
sha256sums=('d644ef89daf5dec1eee626ef888e70e7c3d5fa93ccd6aab0378ca224e7e0db77')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
