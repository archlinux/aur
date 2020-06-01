# Maintainer: Julian Daube <joposter (at) gmail (dot) com>
# Contributor: Julian Daube <joposter (at) gmail (dot) com>
pkgname="python-django-import-export-git"
pkgver=2.1.0.r8.g29a7d96
pkgrel=1
pkgdesc="Django application and library for importing and exporting data with admin integration."
provides=("python-django-import-export")

arch=("any")
url="https://github.com/django-import-export/django-import-export"

source=("$pkgname::git+https://github.com/django-import-export/django-import-export")

depends=("python" "python-tablib" "python-diff-match-patch")
makedepends=("python-setuptools" 
	"python-psycopg2"
)

pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
	cd "$pkgname"
	sh runtests.sh
}

build() {
	cd "$pkgname"
	python setup.py build
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}


md5sums=("SKIP")

