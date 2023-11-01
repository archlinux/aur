# Maintainer: knedl1k <knedl1k At tuta Dot io>
# Contributor: Bruce Zhang
pkgname=ykdl
pkgver=1.8.2
pkgrel=1
pkgdesc="a video downloader focus on China mainland video sites."
arch=('any')
url="https://github.com/SeaHOH/ykdl"
license=('MIT')
depends=('python' 'python-m3u8' 'mpv' 'ffmpeg')
makedepends=('python-setuptools')
optdepends=(
	'python-colorama: Color output'
	'python-urllib3: Support http range'
)
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/SeaHOH/ykdl/archive/v$pkgver.tar.gz")
sha256sums=('8eb58f351e5474170df6bb33f3d3faf456ea8e03e7f1dfe5212631f31516b4e2')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/ykdl/LICENSE.txt"
}
