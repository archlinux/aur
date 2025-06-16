# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: ston <2424284164@qq.com>

pkgname=auto-editor
pkgver=28.0.2
pkgrel=1
pkgdesc="A command line application for automatically editing video and audio."
url="https://auto-editor.com/"
arch=('any')
license=("Unlicense")
depends=('python' 'python-numpy' 'python-av')
optdepends=('yt-dlp: download and use URLs as inputs')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/WyattBlue/auto-editor/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b9ef9e9b4aeec791719ca7a8cb447e638af69ae6f021e201d928e02dca784239')

build() {
	cd auto-editor-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd auto-editor-$pkgver

	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
