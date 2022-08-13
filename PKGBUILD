# Maintainer: weilinfox <weilinfox at inuyasha dot love>

pkgname=thtagger
pkgver=0.0.2
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
install="$pkgname.install"
source=("https://github.com/weilinfox/haku-thtagger/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d39cd18221e32bdb40d0d11db332d579fe74a0e24acb678576773da8624bc0c5')

build() {
	cd "$srcdir/haku-thtagger-$pkgver"
	python setup.py build
}

package() {

	cd "$srcdir/haku-thtagger-$pkgver"
	python setup.py install --skip-build --root=$pkgdir --optimize=1

	install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 img/$pkgname.xpm "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.xpm"
	install -Dm755 thtagger.sh "$pkgdir/usr/bin/thtagger"

}

