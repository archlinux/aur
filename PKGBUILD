# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgbase=python-toml-sort
pkgname=python-toml-sort
_name=${pkgname#python-}
pkgver=0.19.0
pkgrel=2
pkgdesc="Command line utility to sort and format your TOML files"
arch=('any')
license=('MIT')
url="https://pypi.org/project/toml-sort"
makedepends=('python-setuptools')
depends=(
	'python-click'
	'python-tomlkit'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=(2c874a52af3f446af8fbf1a68003fce6dc7ee682ce03994a382e749d2c3a479c5461734b068407bf45a92dd00f06d78bc849426e12db86469a0d0b2c01c83872)

build() {
	# https://wiki.archlinux.org/title/Python_package_guidelines
	cd "$_name-$pkgver" 
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
