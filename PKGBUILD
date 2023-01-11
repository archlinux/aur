# Maintainer: Groctel <aur@taxorubio.com>

_name=moderngl-window

pkgname=python-moderngl-window
pkgver=2.4.2
pkgrel=1
pkgdesc="A utility library for ModernGL making window creation and resource loading simple."

arch=('any')
license=('MIT')
url="https://github.com/moderngl/moderngl-window"

source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('54af3fd48e6aa1a1d55d2b72c54e90e73df366d4e06fea92040e0b3fb75ad24b536584e5a86328a3a51f30a7c4987bbe5ece83b76d58a5126fc677c74a6dfac7')

depends=(
	'python-moderngl'
	'python-numpy'
	'python-pillow'
	'python-pyglet'
	# AUR dependencies
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
