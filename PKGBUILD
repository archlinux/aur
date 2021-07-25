# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

_pkgname=yml2
pkgname=$_pkgname-git
pkgver=2.7.0
pkgrel=1
pkgdesc="A tool written in Python to convert yml to xml"
arch=('any')
url='https://pypi.org/project/yml2'
license=('GPL2')
makedepends=('git' 'python')
depends=('python-lxml')
provides=('yml2')
source=("git+https://gitea.pep.foundation/fdik/yml2.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git tag | sort -V -r | head -n1
}

build() {
	cd "$srcdir/$_pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1
}

