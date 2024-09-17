pkgname=python-templated-dictionary
_name=${pkgname#python-}
pkgver=1.5
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
sha256sums=('52da6aa0dccbfb6bbce767f495dfd8ac5f0ecaa09f4b593820e88976567e7d7c')

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
