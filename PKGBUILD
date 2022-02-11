_pkgname=python-geomag
pkgname=$_pkgname-todd-dembrey-git
pkgver=r31.421564e
pkgrel=1
arch=("any")
license=("LGPL")
url="https://github.com/todd-dembrey/geomag"
makedepends=("git")
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+$url")
sha1sums=("SKIP")

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $_pkgname

	python setup.py build
}

package() {
	cd $_pkgname

	python setup.py install --root="$pkgdir" --optimize=1
}
