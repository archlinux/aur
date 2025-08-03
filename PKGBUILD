# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

pkgname=ytdl-sub
pkgver=2025.07.24
pkgrel=1
pkgdesc="Automate downloading and metadata generation with yt-dlp"
arch=('any')
url="https://github.com/jmbannon/ytdl-sub"
license=('GPL-3.0')
depends=('python' 'yt-dlp' 'python-colorama' 'python-mergedeep' 'python-mediafile' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jmbannon/ytdl-sub/archive/$pkgver.tar.gz")
sha512sums=('4915589768d8fe3f52a6c8179eb74a8e8465306efe83f113b07c7adff03214a4c6cdf4c9f268779364bc4a9d9f693410a58d9be1075d1b0bd66d14eafe619d0c')

build() {
    cd ytdl-sub-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd ytdl-sub-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
