pkgname=python-flask-paginate
_name=${pkgname#python-}
pkgver=2024.4.12
pkgrel=2
pkgdesc="A simple paginate extension for flask"
arch=('any')
license=('BSD')
url="https://github.com/lixxu/flask-paginate"
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('3a952b2bf3a93473e2c841f9083e968b4b07018fac7bac8baa909889e1d4c29727b5fae77f1a49a67fae14a30713271e0dac932f2aa966d22db8fe57bdc917bb')

build() {
	# https://wiki.archlinux.org/title/Python_package_guidelines
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
