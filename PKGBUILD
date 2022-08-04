# Maintainer: Robin Ekman < robin.seth.ekman [at] gmail [dot] com >

pkgname=oldfashiond
pkgver=0.1.2
pkgrel=1
pkgdesc=" Create gifs using two-pass encoding with ffmpeg "
url='https://github.com/rsekman/oldfashiond'
arch=('any')
license=('MIT')
depends=('python>=3.8' 'ffmpeg>=2.6')
optdepends=(
    'python-srt: srt support'
    'python-ass: ass support'
    'python-humanfriendly: nicer logs'
)
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a57138e59b01d57e2905bfb522a0614d947892ae8897ffa20eddc8d78b1bd4ea')

provides=("${pkgname}")

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
