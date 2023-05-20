pkgname=python-flask-paginate
_name=${pkgname#python-}
pkgver=2022.1.8
pkgrel=1
pkgdesc="A simple paginate extension for flask"
arch=('any')
license=('BSD')
url="https://pypi.org/project/flask-paginate"
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=(8c15dabd34a489f9f823178f4f4310eb5157bee8afd46542bd58ddff1af8caa9595e544dbb22ace3473ef4fe8ff5c995f39e9d80e79531cce8169a97cd59c565)

build() {
	# https://wiki.archlinux.org/title/Python_package_guidelines
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
