# Maintainer: Petr Velička <petrvelicka@tuta.io>
pkgname=python-tariff
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=1
pkgdesc="Make importing great again! A parody package that imposes tariffs on Python imports."
arch=('any')
url="https://github.com/hxu296/tariff"
license=('MIT')
depends=('python')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('20d738a789f96146ae49de4fffc000ea9942bd4335f0cdc336d2c824e6aa063b')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
