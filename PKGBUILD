# Maintainer: YeahSure <lapdogpdx.yahoo.com>

pkgname=colout-git
_pkgname=colout
pkgver=r247.438838d
pkgrel=1
pkgdesc="Reads text on stdin and produces colorized and stylized output"
arch=('any')
url="http://nojhan.github.com/colout/"
license=('GPL')
depends=('python' 'python-pip')
optdepends=('python-pygments' 'python-babel')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=('colout::git://github.com/nojhan/colout.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1
}

