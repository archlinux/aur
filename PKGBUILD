# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=python-byml
_name=${pkgname#python-}
pkgver=2.4.2
pkgrel=1
pkgdesc="A simple Nintendo BYML or BYAML v2/v3 parser and writer"
arch=('any')
url="https://github.com/zeldamods/byml-v2"
license=('GPL2')
depends=('python' 'python-pyaml' 'python-sortedcontainers' 'python-oead')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('9cc6d99bd0a025d6b62297043a8c3e6579a0a8f5112aa5ee56ccf5e5f2f64355')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
