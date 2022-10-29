# Maintainer: Robin Ekman < robin.seth.ekman [at] gmail [dot] com >

pkgname=oldfashiond
pkgver=0.1.3
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
sha256sums=('a46e898e968c1a58ad6d79379f690404f25240965461607d9d277be02890243e')

provides=("${pkgname}")

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
