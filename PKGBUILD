# Maintainer: Ainola

pkgname=python-image
pkgver=1.5.29
pkgrel=1
pkgdesc="Django application that provides editing for images and videos"
arch=('any')
url="https://github.com/francescortiz/image"
license=('BSD')
makedepends=('python-setuptools')
depends=('python-pillow' 'python-requests' 'python-django')
optdepends=('ffmpeg: For video thumbnails')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/i/image/image-$pkgver.tar.gz")
sha256sums=('4960226156fe7d3c7f2e8db5efe3deda58481a46daa7a1c26fbc0fa1f5654cc4')

build() {
    cd "image-$pkgver"
    python setup.py build
}

package() {
    cd "image-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README -t "$pkgdir/usr/share/licenses/$pkgname/"
}
