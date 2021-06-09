# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgbase=python-flask-paginate
pkgname=python-flask-paginate
_name=${pkgname#python-}
pkgver=0.8.1
pkgrel=4
pkgdesc="A simple paginate extension for flask"
arch=('any')
license=('BSD')
url="https://pypi.org/project/flask-paginate"
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=(b06536d59e943b8e3b8562447903f40f2f23ed4f3cb1795c48b4586be64ffcc067371de653d3dc614664554152d35fa60441c7ba3cddcc4a0188202fbe0d44ca)

build() {
	# https://wiki.archlinux.org/title/Python_package_guidelines
	cd "$_name-$pkgver" 
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
