# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: ston <2424284164@qq.com>

pkgname=auto-editor
pkgver=24.7.1
_pkgver=24w07a
pkgrel=1
pkgdesc="A command line application for automatically editing video and audio."
url="https://auto-editor.com/"
arch=('any')
license=("Unlicense")
depends=('python' 'python-numpy' 'python-pyav')
optdepends=('yt-dlp: download and use URLs as inputs')
makedepends=('python-setuptools' 'python-build' 'python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/WyattBlue/auto-editor/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('a5c7fc9f8d36d1ab42f27003a7b8130e6af4df070bff3f29f4bb79535e99ccc0')

build() {
	cd auto-editor-$_pkgver
	python -m build
}

package() {
	cd auto-editor-$_pkgver
	python -m pip install --root="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
