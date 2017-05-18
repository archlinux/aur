# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>

pkgname=python-plac-git
pkgdesc="A tool to write command-line interfaces for Python applications"
pkgver=20170202
pkgrel=1
arch=('any')
url="https://github.com/micheles/plac"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("git+https://github.com/micheles/plac.git")
md5sums=('SKIP')

pkgver() {
	cd plac
	git log --format="%cd" --date=short -1 | sed 's/-//g'
}

package() {
	cd plac
	python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
