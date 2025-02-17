# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name='pymunk'
pkgname=python-${_name}
pkgver=6.11.1
pkgrel=1
pkgdesc="Pymunk (built on top of Chipmunk2D) is an easy-to-use pythonic 2D physics library that can be used whenever you need 2D rigid body physics from Python."
arch=('x86_64')
url='http://www.pymunk.org/'
license=('MIT')
makedepends=('python-setuptools' 'python-wheel' 'python-cffi')
depends=('python>=3.8' 'python-cffi')
optdepends=('python-pyglet' 'python-pygame' 'python-sphinx' 'python-aafigure' 'python-wheel' 'python-matplotlib' 'python-numpy')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1917849f63e1f699df21d6a1f5d1c250adddbae25e9c124f0bed765154c94ef8')

build() {
	cd "$srcdir"/pymunk-$pkgver
	python setup.py build
}

package() {
	cd "$srcdir"/pymunk-$pkgver
	python setup.py install -O1 --skip-build --root="$pkgdir"
}
