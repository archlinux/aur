# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

pkgname=ytdl-sub
pkgver=2024.11.05
pkgrel=1
pkgdesc="Automate downloading and metadata generation with yt-dlp"
arch=('any')
url="https://github.com/jmbannon/ytdl-sub"
license=('GPL-3.0')
depends=('python' 'yt-dlp' 'python-colorama' 'python-mergedeep' 'python-mediafile' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jmbannon/ytdl-sub/archive/$pkgver.tar.gz")
sha512sums=('93e595e77dd9f929ba6c0dfa47d3de28dfc1b6c9c5f4d4c41c3eddf0757608ef6508bf9257cd2c06e8157e849403effd895da71c9075cf5a75802d783bd816e7')

build() {
    cd ytdl-sub-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd ytdl-sub-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
