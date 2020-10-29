# Maintainer: Brett Cornwall <ainola@archlinux.org>

pkgname=python-image
pkgver=1.5.33
pkgrel=1
pkgdesc="Django application that provides editing for images and videos"
arch=('any')
url="https://github.com/francescortiz/image"
license=('BSD')
makedepends=('python-setuptools')
depends=('python-pillow' 'python-requests' 'python-django')
optdepends=('ffmpeg: For video thumbnails')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/i/image/image-$pkgver.tar.gz")
sha256sums=('baa2e09178277daa50f22fd6d1d51ec78f19c12688921cb9ab5808743f097126')

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
