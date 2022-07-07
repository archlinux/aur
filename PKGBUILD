# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-kgt
_pkg="${pkgname#python-}"
pkgver=0.4.7
pkgrel=1
pkgdesc="Python tools for keygen.sh licensing"
arch=('any')
url='https://pypi.org/project/kgt'
license=('custom:proprietary')
depends=(
	'python>=3.7'
	'python-appdirs'
	'python-cryptography'
	'python-pynacl'
	'python-requests'
	'python-rich'
	'python-tomli'
	'python-tomli-w'
	'python-x21')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/py3/${_pkg::1}/$_pkg/$_pkg-$pkgver-py3-none-any.whl")
noextract=("$_pkg-$pkgver-py3-none-any.whl")
sha256sums=('1e235b79c7e57b608726c87d9bd5197e06a1a5c8219d2bf4052550e219498af6')

package() {
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" *.whl
}
