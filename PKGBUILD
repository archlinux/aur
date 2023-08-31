# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: ston <2424284164@qq.com>

pkgname=auto-editor
pkgver=23.35.1
_pkgver=23w35a
pkgrel=1
pkgdesc="A command line application for automatically editing video and audio."
url="https://auto-editor.com/"
arch=('any')
license=("Unlicense")
depends=('python' 'python-numpy' 'python-pillow' 'python-av')
optdepends=('yt-dlp: download and use URLs as inputs')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/WyattBlue/auto-editor/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('0f93d94330948c02df5b918b8dfc28847d4c4bd3485f2757568dda0ebebf4c2d')

build() {
	cd auto-editor-$_pkgver
	python setup.py build
}

package() {
	cd auto-editor-$_pkgver
	python setup.py install --root="$pkgdir"
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
