# Maintainer: Julian Daube <joposter (at) gmail (dot) com>
# Contributor: Julian Daube <joposter (at) gmail (dot) com>

_pkgname=python-hdlparse
pkgname=$_pkgname-git
pkgver=r20.be7cdab
pkgrel=1
pkgdesc="Simple parser for extracting VHDL documentation"

arch=("any")
license=("mit")
url="https://github.com/kevinpt/hdlparse.git"
provides=("$_pkgname")

depends=("python")
makedepends=("python-setuptools")

source=("$_pkgname::git+$url")

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	python setup.py build
}

package() {
	cd "$_pkgname"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/"$_pkgname"/LICENSE
}

md5sums=("SKIP")
