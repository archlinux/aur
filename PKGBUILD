# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name='pymunk'
pkgname=python-${_name}
pkgver=6.10.0
pkgrel=1
pkgdesc="Pymunk (built on top of Chipmunk2D) is an easy-to-use pythonic 2D physics library that can be used whenever you need 2D rigid body physics from Python."
arch=('x86_64')
url='http://www.pymunk.org/'
license=('MIT')
makedepends=('python-setuptools' 'python-wheel' 'python-cffi>=1.17.1' 'gcc')
depends=('python>=3.8' 'python-cffi>=1.17.1')
optdepends=('python-pyglet<2.0.0' 'python-pygame' 'python-sphinx' 'python-aafigure' 'python-wheel' 'python-matplotlib' 'python-numpy' 'python-sphinx-autodoc-typehints')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('62f7c7247c05b8441fb0e1937532c3d3b9c21a46aa48f3881cf5c892cf2acb25')

build() {
	cd "$srcdir"/pymunk-$pkgver
	python setup.py build
}

package() {
	cd "$srcdir"/pymunk-$pkgver
	python setup.py install -O1 --skip-build --root="$pkgdir"

	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
