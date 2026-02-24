# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

pkgname=ytdl-sub
pkgver=2026.02.23
pkgrel=1
pkgdesc="Automate downloading and metadata generation with yt-dlp"
arch=('any')
url="https://github.com/jmbannon/ytdl-sub"
license=('GPL-3.0')
depends=('python' 'yt-dlp' 'python-colorama' 'python-mergedeep' 'python-mediafile' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jmbannon/ytdl-sub/archive/$pkgver.tar.gz")
sha512sums=('f89d8e05eb5fa1980fdba3e961ab5987ad0f1a2771417864611dcbf9f1d0b92ad542dd8ba5f29ac09c1af5dacef96eb12d9b54401de6fe1198836898a90ec776')

build() {
    cd ytdl-sub-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd ytdl-sub-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
