# Maintainer: Sapphira Armageddos <shadowkyogre.public+aur <AT> gmail <DOT> com>

pkgname=python-asciimathml-git
pkgver=70.50fd95c
pkgrel=1
pkgdesc="ASCIIMathML to MathML translator (Python 3 port)"
arch=('any')
url="https://github.com/mtahmed/python-asciimathml"
license=('GPL2')
depends=('python')
optdepends=('python-markdown')
makedepends=('git')
provides=('python-asciimathml')
source=("$pkgname"::'git://github.com/mtahmed/python-asciimathml')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="${pkgdir}"
}
