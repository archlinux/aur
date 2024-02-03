pkgname=python-templated-dictionary
_name=${pkgname#python-}
pkgver=1.4
_rpmrel=1
_pkgtag=$pkgname-$pkgver-$_rpmrel
pkgrel=$_rpmrel.1
pkgdesc="Dictionary where every item is evaluated as a Jinja2 expression"
arch=('any')
url="https://github.com/xsuchy/templated-dictionary"
license=('GPL-2.0-or-later')
depends=('python' 'python-jinja')
makedepends=('python-setuptools')
source=("$url/archive/$_pkgtag.tar.gz")
sha256sums=('2fdc220dd5f931ac9149a8d01d1a6d9334d093da514581cdd0175cc72e6542d9')

prepare() {
	mv "$_name-$_pkgtag" "$_name-$pkgver"
}

build() {
	cd "$_name-$pkgver"
	python ./setup.py build
}

package() {
	cd "$_name-$pkgver"
	python ./setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim: set ft=sh ts=4 sw=4 noet:
