# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: ston <2424284164@qq.com>

pkgname=auto-editor
pkgver=24.29.1
_pkgver=24w29a
pkgrel=1
pkgdesc="A command line application for automatically editing video and audio."
url="https://auto-editor.com/"
arch=('any')
license=("Unlicense")
depends=('python' 'python-numpy' 'python-av')
optdepends=('yt-dlp: download and use URLs as inputs')
makedepends=('python-setuptools' 'python-build' 'python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/WyattBlue/auto-editor/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('87c5e8cfcd45dc9df969a5c8485298239eeb2cac411bf6307b10d8f8c6be3980')

build() {
	cd auto-editor-$_pkgver
	python -m build
}

package() {
	cd auto-editor-$_pkgver
	python -m pip install --no-dependencies --root="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
