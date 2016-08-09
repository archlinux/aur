# Maintainer: Sapphira Armageddos <shadowkyogre.public+aur <AT> gmail <DOT> com>

pkgname=python-asciimathml-git
pkgver=0.9.5.1.r0.g01d1a44
pkgrel=2
pkgdesc="ASCIIMathML to MathML translator (Python 3)"
arch=('any')
url="https://github.com/ShadowKyogre/python-asciimathml"
license=('GPL2')
depends=('python')
optdepends=('python-markdown')
makedepends=('git')
conflicts=('python-asciimathml')
provides=('python-asciimathml')
source=("$pkgname"::'git://github.com/ShadowKyogre/python-asciimathml')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --root="${pkgdir}"
}
