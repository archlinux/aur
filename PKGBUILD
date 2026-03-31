# Maintainer: The SP <ammarsyamil057@gmail.com>
pkgname=anifetch-cli
pkgver=1.0.2
pkgrel=1.1
pkgdesc="Animated terminal fetch with video and audio support"
arch=('any')
url="https://github.com/Notenlish/anifetch"
license=('MIT')
depends=('python' 'chafa' 'ffmpeg' 'fastfetch')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Notenlish/anifetch/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('75e228a11c1d7816e30f0f0269de8f8c8f5c6e85c02be921791b0d6efb2fb546')

build() {
  cd "$srcdir/anifetch-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/anifetch-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}