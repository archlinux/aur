# Maintainer: Ainola

pkgname=python-image
pkgver=1.5.27
pkgrel=2
pkgdesc="Django application that provides editing for images and videos"
arch=('any')
url="https://github.com/francescortiz/image"
license=('BSD')
makedepends=('python-setuptools')
depends=('python-pillow' 'python-requests' 'python-django')
optdepends=('ffmpeg: For video thumbnails')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/i/image/image-$pkgver.tar.gz")
sha256sums=('3f0ea15fb523c68a08098153bb06f4a8913300277e11b61c5e71fdd57b243783')

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
