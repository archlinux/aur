# Maintainer: Bruce Zhang
pkgname=ykdl
pkgver=1.6.3
pkgrel=3
pkgdesc="a video downloader focus on China mainland video sites."
arch=('any')
url="https://github.com/zhangn1985/ykdl"
license=('MIT')
depends=('python' 'python-m3u8' 'python-pycryptodome' 'python-urllib3' 'python-iso8601')
makedepends=('python-setuptools')
optdepends=(
	'nodejs: JavaScript runtime for DouyuTV'
	'gjs: JavaScript runtime for DouyuTV'
	'cjs: JavaScript runtime for DouyuTV'
)
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/zhangn1985/ykdl/archive/v1.6.3.tar.gz")
sha256sums=('9fea4248d00bb706dd6cd1371b4b51b27c789fe4daf52008df83f26fc0d304bf')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/ykdl/LICENSE.txt"
}
