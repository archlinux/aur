# Maintainer: Robin Ekman < robin.seth.ekman [at] gmail [dot] com >

pkgname=oldfashiond
pkgver=0.2.0
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
sha256sums=('dcf4045391f78b23d47ea01bb01dc6d8663dbbc3cd17763f2377aa37f92d2122')

provides=("${pkgname}")

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
