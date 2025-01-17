# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

pkgname=ytdl-sub
pkgver=2025.01.15
pkgrel=1
pkgdesc="Automate downloading and metadata generation with yt-dlp"
arch=('any')
url="https://github.com/jmbannon/ytdl-sub"
license=('GPL-3.0')
depends=('python' 'yt-dlp' 'python-colorama' 'python-mergedeep' 'python-mediafile' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jmbannon/ytdl-sub/archive/$pkgver.tar.gz")
sha512sums=('8e25a295ed3d102db94a800e74793d4c1209110c43951220114ac1e2b1d1f05a94d8e74cf96553bdc9d7495f2b1d31d3e32f367552b7db3a1bfe0f284331c694')

build() {
    cd ytdl-sub-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd ytdl-sub-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
