# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: ston <2424284164@qq.com>

pkgname=auto-editor
pkgver=24.3.1
_pkgver=24w03a
pkgrel=1
pkgdesc="A command line application for automatically editing video and audio."
url="https://auto-editor.com/"
arch=('any')
license=("Unlicense")
depends=('python' 'python-numpy' 'python-pyav')
optdepends=('yt-dlp: download and use URLs as inputs')
makedepends=('python-setuptools' 'python-build' 'python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/WyattBlue/auto-editor/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('1e15583e28d626aa1f464f075e141f2852f22c3b43f8b68a4194f3ed7153f59b')

build() {
	cd auto-editor-$_pkgver
	python -m build
}

package() {
	cd auto-editor-$_pkgver
	python -m pip install --root="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
