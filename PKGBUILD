# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=python-aamp
_name=${pkgname#python-}
pkgver=1.4.1
pkgrel=1
pkgdesc="Nintendo parameter archive (AAMP) library"
arch=('any')
url="https://github.com/leoetlino/aamp"
license=('GPL2')
depends=('python' 'python-pyaml')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('c83c47ebf68585d7ebdafd48a0fc7e6771d9a1dd0d219c3e3f8c92865901e755')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
