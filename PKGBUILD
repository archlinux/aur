# Maintainer: Groctel <aur@taxorubio.com>
pkgname=python-moderngl-window
_name=moderngl-window
pkgver=2.3.0
pkgrel=1
pkgdesc="A utility library for ModernGL making window creation and resource loading simple."
arch=('any')
url="https://github.com/moderngl/moderngl-window"
license=('MIT')
depends=(
	'python-numpy'
	'python-pillow'
	'python-pyglet'
	# AUR dependencies
	'python-moderngl-git'
	'python-pyrr'
)
makedepends=(
	'python-setuptools'
)
provides=()
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('e0a4a0d92e6ba2c89770b76373b337bac8ab2bcba6758c9b76607941e3b22f6ce7677f213a8e48a6b5367fe487dde8b859d503589c30b918695f4113372b131b')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

