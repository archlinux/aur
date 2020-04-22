# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

_pkgname=yml2
pkgname=$_pkgname-hg
pkgver=2.6.3
pkgrel=1
pkgdesc="A tool written in Python to convert yml to xml"
arch=('any')
url='https://pep.foundation/dev/repos/yml2'
license=('GPL2')
makedepends=('mercurial' 'python')
depends=('python-lxml')
provides=('yml2')
source=("hg+https://pep.foundation/dev/repos/yml2")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	awk '/^version/ {print $3}' setup.cfg
}

build() {
	cd "$srcdir/$_pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1
}

