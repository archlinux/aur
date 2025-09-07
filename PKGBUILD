# Contributor: Tehoor Marjan <tehoor.marjan@gmail.com>
# Contributor: OmegaRogue <omegarogue@omegavoid.codes>
pkgname=python-pymcuprog
pkgver=3.19.4.61
pkgrel=1
pkgdesc="Tools for programming of MCUs using Microchip CMSIS-DAP based debuggers"
_name=${pkgname#python-}
arch=('any')
url="https://github.com/microchip-pic-avr-tools/pymcuprog"
license=('MIT')
# No handling of LICENSE file because it is included in the wheel
depends=('python-pyserial' 'python-intelhex' 'python-yaml' 'python-appdirs' 'python-pyedbglib')
# Note: artifactory and requests are needed only by internal scripts, not by the main package
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('66be870b6edbb413443e7fa59882b6d4504c3b9d8aadeca85c55e83459d64408')
makedepends=('python-installer')

package() {
	python -m installer --destdir="$pkgdir" ${_name}-${pkgver}-py3-none-any.whl
}
