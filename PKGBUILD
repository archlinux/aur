# Maintainer: Groctel <aur@taxorubio.com>

_name=moderngl-window

pkgname=python-moderngl-window
pkgver=2.4.1
pkgrel=1
pkgdesc="A utility library for ModernGL making window creation and resource loading simple."

arch=('any')
license=('MIT')
url="https://github.com/moderngl/moderngl-window"

source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('0a55ad384892ad5bf270901356750457614f7ced75bd7a7930a5cd530491eee9c3ed980b6dd561fd6ba892588388a61b890cc7af353de80cd50b3bd892b9ce9a')

depends=(
	'python-numpy'
	'python-pillow'
	'python-pyglet'
	# AUR dependencies
	'python-moderngl-git'
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
