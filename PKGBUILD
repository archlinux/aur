# Maintainer: Groctel <aur@taxorubio.com>
pkgname=python-moderngl-window
_name=moderngl-window
pkgver=2.4.0
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
sha512sums=('5774db4a52aed7b7dbce56cdfb06bafed04bec8234c84f1cd424cffe8458f0344826d8e52cb53c537d83c83cb4d949ff7f22aded65e0fedae908179e118931a9')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

