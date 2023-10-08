pkgname=python-flask-paginate
_name=${pkgname#python-}
pkgver=2023.10.8
pkgrel=1
pkgdesc="A simple paginate extension for flask"
arch=('any')
license=('BSD')
url="https://github.com/lixxu/flask-paginate"
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('89b03f7f65a3f0ec2497400daaad9c9176cfbea1bcd7b3726f9e33d9a4f333d5a080e119834c38aa48c62a664dd3d9323b12a02df706d74912250b3ca567db5e')

build() {
	# https://wiki.archlinux.org/title/Python_package_guidelines
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
