# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgbase=python-toml-sort
pkgname=python-toml-sort
_name=${pkgname#python-}
pkgver=0.19.0
pkgrel=1
pkgdesc="Command line utility to sort and format your TOML files"
arch=('any')
license=('MIT')
url="https://pypi.org/project/toml-sort"
makedepends=('python-pip')
depends=(
	'python-click'
	'python-tomlkit'
)
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name/-/_}-$pkgver-py3-none-any.whl")
sha512sums=(9c031c282af52aacac582216392efbfc13fca1ca84aa141c0cf736f712c08b5bd7925d533eec1b58ca0df94425099892dd9269e6a0911b510fdc7e4fc2ba44c8)

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --no-warn-script-location *.whl
}
