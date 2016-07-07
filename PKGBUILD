# Maintainer: Anselmo L. S. Melo <anselmolsm@gmail.com>
pkgname=python-gantt-hg
pkgver=r183.debfd93598ec
pkgrel=1
pkgdesc="Python-Gantt make possible to easily draw gantt charts from Python. Output format is SVG."
arch=('any')
url="http://xael.org/pages/python-gantt-en.html"
license=('GPL3')
makedepends=('mercurial')
provides=("${pkgname%-hg}")
conflicts=("${pkgname%-hg}")
depends=('python' 'python-svgwrite' 'python-dateutil')
optional=('python-clize')
source=('python-gantt::hg+https://bitbucket.org/xael/python-gantt')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-hg}"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
	cd "$srcdir/${pkgname%-hg}"
	python3 setup.py build
}

package() {
	cd "$srcdir/${pkgname%-hg}"
	python3 setup.py install --root=$pkgdir --optimize=1 --skip-build
}

# vim:set sw=2 et:
