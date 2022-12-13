pkgname=python-templated-dictionary
_name=${pkgname#python-}
pkgver=1.2
pkgrel=1
pkgdesc="Dictionary where every item is evaluated as a Jinja2 expression"
arch=('any')
url="https://github.com/xsuchy/templated-dictionary"
license=('GPL2')
depends=('python' 'python-jinja')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6972d3bca252b39cb4d87c35657016fa964e94b218c136d4642f08c60a0886fb')

build() {
	cd "$_name-$pkgver"
	python ./setup.py build
}

package() {
	cd "$_name-$pkgver"
	python ./setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim: set ft=sh ts=4 sw=4 noet:
