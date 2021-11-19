# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=python-botw_havok
_name=${pkgname#python-}
pkgver=0.3.18
pkgrel=1
pkgdesc="A library for manipulating Breath of the Wild Havok packfiles"
arch=('any')
url="https://github.com/krenyy/botw_havok"
license=('GPL3')
depends=('python' 'python-colorama' 'python-numpy' 'python-oead')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('8752198d047d5a743e2b3b748af62701f1fbcb8d8dcbef4e5941bd67bcad6487')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
