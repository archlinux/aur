# Maintainer: weilinfox <weilinfox at inuyasha dot love>

pkgname=thtagger
pkgver=0.0.1
pkgrel=1
pkgdesc='一个简单的，基于 Python3 、 PySide6 和 Mutagen 的音乐元数据编辑器'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/weilinfox/haku-thtagger'
license=('GPL2')
depends=('hicolor-icon-theme'
         'pyside6'
         'python-mutagen'
         'python-requests')
makedepends=('python-setuptools')
source=("https://github.com/weilinfox/haku-thtagger/archive/refs/tags/$pkgver-3.tar.gz")
sha256sums=('514339dc2aff5986abea1b93acaf48993c888be028042a21605bd8c5c42a5832')

build() {
	cd "$srcdir/haku-thtagger-$pkgver-3"
	python setup.py build
}

package() {

	cd "$srcdir/haku-thtagger-$pkgver-3"
	python setup.py install --skip-build --root=$pkgdir --optimize=1

	install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 img/$pkgname.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
	install -Dm755 thtagger.sh "$pkgdir/usr/bin/thtagger"

}

