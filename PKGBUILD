# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: ston <2424284164@qq.com>

pkgname=auto-editor
pkgver=24.24.1
_pkgver=24w24a
pkgrel=1
pkgdesc="A command line application for automatically editing video and audio."
url="https://auto-editor.com/"
arch=('any')
license=("Unlicense")
depends=('python' 'python-numpy' 'python-pyav')
optdepends=('yt-dlp: download and use URLs as inputs')
makedepends=('python-setuptools' 'python-build' 'python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/WyattBlue/auto-editor/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('671d1b97595d428ef5a2e1b29768efa88d9a2f6a1cf741e0f2ccf6d2d7d807f4')

build() {
	cd auto-editor-$_pkgver
	python -m build
}

package() {
	cd auto-editor-$_pkgver
	python -m pip install --no-dependencies --root="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
