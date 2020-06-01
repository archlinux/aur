# Maintainer: Julian Daube <joposter (at) gmail (dot) com>
# Contributor: Julian Daube <joposter (at) gmail (dot) com>
_pkgname=python-django-weasyprint
pkgname=$_pkgname-git
pkgver=v0.6.0.r14.g1e0a377
pkgrel=1
pkgdesc="A Django class-based view generating PDF resposes using WeasyPrint"

provides=("$_pkgname")
url="https://github.com/fdemmer/django-weasyprint"
arch=("any")
license=("Apache")

source=("$pkgname::git+$url")
depends=("python-django" "python-weasyprint")
makepepends=("python-setuptools")


pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
