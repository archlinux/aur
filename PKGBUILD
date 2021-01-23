pkgname=python-templated-dictionary
_name=${pkgname#python-}
pkgver=1.1
pkgrel=1
pkgdesc="Dictionary where every item is evaluated as a Jinja2 expression"
arch=('any')
url="https://github.com/xsuchy/templated-dictionary"
license=('GPL2')
depends=('python' 'python-jinja')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('65c57a292b836f1437186b96d121401d')

build() {
	cd "$_name-$pkgver"
	python ./setup.py build
}

package() {
	cd "$_name-$pkgver"
	python ./setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim: set ft=sh ts=4 sw=4 noet:
