# Maintainer: Julian Daube <joposter (at) gmail (dot) com>
# Contributor: Julian Daube <joposter (at) gmail (dot) com>

pkgname="python-django-markdownx-git"
pkgver=1.0
pkgrel=1

arch=("any")
url="https://neutronx.github.io/django-markdownx/"

provides=("python-django-markdownx")

source=("$pkgname::git+https://github.com/neutronX/django-markdownx")

depends=("python" "python-django" "python-pillow" "python-markdown")
makedepends=("python-setuptools")

ver() {
        cd "$pkgname"
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $pkgname
	python setup.py build
}

package() {
	cd $pkgname
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

md5sums=("SKIP")
