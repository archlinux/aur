# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: ston <2424284164@qq.com>

pkgname=auto-editor
pkgver=23.40.1
_pkgver=23w40a
pkgrel=1
pkgdesc="A command line application for automatically editing video and audio."
url="https://auto-editor.com/"
arch=('any')
license=("Unlicense")
depends=('python' 'python-numpy' 'python-pillow' 'python-av')
optdepends=('yt-dlp: download and use URLs as inputs')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/WyattBlue/auto-editor/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('133d0da39e5b979507d9a4703b7be0790d9a3ed0b2a294408b6bac60925400c5')

build() {
	cd auto-editor-$_pkgver
	python setup.py build
}

package() {
	cd auto-editor-$_pkgver
	python setup.py install --root="$pkgdir"
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
