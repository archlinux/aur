# Maintainer: Jomosoto <jomosoto dot proton dot me>

pkgname=yaffshiv-git
_pkgname=yaffshiv
pkgver=r45.f6f0ef7
pkgrel=1
pkgdesc='A simple YAFFS file system parser and extractor'
arch=('any')
url='https://github.com/devttys0/yaffshiv'
license=('MIT')
depends=(python)
makedepends=(python-setuptools)
source=("git+$url")
sha256sums=('SKIP')

build() {
	cd "$_pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

pkgver() {
	cd $_pkgname
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
