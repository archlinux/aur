# Maintainer: Groctel <aur@taxorubio.com>

_name=moderngl-window

pkgname=python-moderngl-window
pkgver=2.4.4
pkgrel=1
pkgdesc="A utility library for ModernGL making window creation and resource loading simple."

arch=('any')
license=('MIT')
url="https://github.com/moderngl/moderngl-window"

source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('8c8f027c2be4d9acfed3ac0f299e0d27bd0a0f2b7ad7f87d5309c276fa3a8ff4afd417e94f808a22a8ff683ae2465aba6a8d09dc07d621dff2b9f8606ceb3ccd')

depends=(
	'python-moderngl'
	'python-numpy'
	'python-pillow'
	# AUR dependencies
	'python-pyglet'
	'python-pyrr'
)
makedepends=('python-setuptools')

build ()
{
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package ()
{
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
