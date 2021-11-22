# Maintainer: Bruce Zhang
pkgname=ykdl
pkgver=1.7.2
pkgrel=1
pkgdesc="a video downloader focus on China mainland video sites."
arch=('any')
url="https://github.com/SeaHOH/ykdl"
license=('MIT')
depends=('python' 'python-m3u8')
makedepends=('python-setuptools')
optdepends=(
	'python-colorama: Color output'
	'python-urllib3: Support http range'
)
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/SeaHOH/ykdl/archive/v$pkgver.tar.gz")
sha256sums=('47d2f8cda2fbbc305ef64c0413c973d60d6276e085584a8f642072e0926f3366')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/ykdl/LICENSE.txt"
}
