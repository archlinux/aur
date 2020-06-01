# Maintainer: Julian Daube <joposter (at) gmail (dot) com>
# Contributor: Julian Daube <joposter (at) gmail (dot) com>
pkgname=python-django-qr-code-git
pkgver=1.2.0.r0.g8837861
pkgrel=1
pkgdesc="An application that provides tools for displaying QR codes on your Django site."

provides=("python-django-qr-code")
url="https://github.com/dprog-philippe-docourt/django-qr-code"
arch=("any")
license=("BSD")

source=("$pkgname::git+https://github.com/dprog-philippe-docourt/django-qr-code")
depends=("python-django>=2.2" "python-qrcode>=6.1" "python-pillow")
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
	
	install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/python-django-qr-code/LICENSE
}

md5sums=("SKIP")
