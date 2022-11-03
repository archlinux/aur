# Maintainer: ston <2424284164@qq.com>

pkgname=auto-editor
pkgver=22.43
_pkgver=22w43a
pkgrel=1
pkgdesc="A command line application for automatically editing video and audio."
url="https://auto-editor.com/"
arch=('any')
license=("Unlicense")
depends=('python' 'python-numpy' 'python-pillow' 'python-av')
optdepends=('ytdlp: download and use URLs as inputs')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/WyattBlue/auto-editor/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('508e2b9c587ff2f35a424c5193ec69881f25422b66e39b5da39c9457a4766b8d')

build(){
	cd auto-editor-$_pkgver
	python setup.py build
}

package(){
	cd auto-editor-$_pkgver
	python setup.py install --root="$pkgdir"
  	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
