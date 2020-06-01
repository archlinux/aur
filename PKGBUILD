# Maintainer: Julian Daube <joposter (at) gmail (dot) com>
# Contributor: Julian Daube <joposter (at) gmail (dot) com>

pkgname="python-django-markdownx-git"
pkgver=v3.0.1.r2.g30f2930
pkgrel=1
pkgdesc="Comprehensive Markdown plugin built for Django"
arch=("any")
url="https://github.com/neutronX/django-markdownx"
license=("bsd")

provides=("python-django-markdownx")

source=("$pkgname::git+$url")

depends=("python" "python-django" "python-pillow" "python-markdown")
makedepends=("python-setuptools")

pkgver() {
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
	
	install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/python-django-markdownx/LICENSE
}

md5sums=("SKIP")
