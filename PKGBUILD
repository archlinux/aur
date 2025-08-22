# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

pkgname=ytdl-sub
pkgver=2025.08.22.post2
pkgrel=1
pkgdesc="Automate downloading and metadata generation with yt-dlp"
arch=('any')
url="https://github.com/jmbannon/ytdl-sub"
license=('GPL-3.0')
depends=('python' 'yt-dlp' 'python-colorama' 'python-mergedeep' 'python-mediafile' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jmbannon/ytdl-sub/archive/$pkgver.tar.gz")
sha512sums=('1cf043dae09af1946f2378acba623b0e57cf5b7a897e525d1b54c34deb80b98f4fcdbd46c78c910a5cd8b3ad8b20b66c098ec771b79affc71506a61d4db056d2')

build() {
    cd ytdl-sub-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd ytdl-sub-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
