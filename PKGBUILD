# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: ston <2424284164@qq.com>

pkgname=auto-editor
pkgver=23.51.1
_pkgver=23w51a
pkgrel=1
pkgdesc="A command line application for automatically editing video and audio."
url="https://auto-editor.com/"
arch=('any')
license=("Unlicense")
depends=('python' 'python-numpy' 'python-pillow' 'python-pyav')
optdepends=('yt-dlp: download and use URLs as inputs')
makedepends=('python-setuptools' 'python-build' 'python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/WyattBlue/auto-editor/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('6dbaaaf67a05997301336b5866ae700adbefcf9d99ef8c0f25f0065d29ac7e31')

build() {
	cd auto-editor-$_pkgver
	python -m build
}

package() {
	cd auto-editor-$_pkgver
	python -m pip install --root="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
