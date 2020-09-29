# Maintainer: Brad Erhart <brae.04+aur@gmail.com>

pkgbase=python-flask-paginate
pkgname=python-flask-paginate
_name=${pkgname#python-}
pkgver=0.7.1
pkgrel=1
pkgdesc="A simple paginate extension for flask"
arch=('any')
license=('BSD')
url="https://pypi.org/project/flask-paginate"
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/${_name/-/_}-$pkgver-py2.py3-none-any.whl")
sha512sums=(468dd5eda236cf5a3d0d9c3be01476f871b8575d2d7c55cb40ac643d8b46bd1a04541fd1fd7f32516fc3020202d1d09a0a56ec9bc0b9149ef0583de07d2dd078)

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
