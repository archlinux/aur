# Contributor: Tehoor Marjan <tehoor.marjan@gmail.com>
# Contributor: OmegaRogue <omegarogue@omegavoid.codes>
pkgname=python-pyedbglib
pkgver=2.24.2.18
pkgrel=1
pkgdesc="Low-level protocol library for communicating with Microchip CMSIS-DAP based debuggers"
_name=${pkgname#python-}
arch=('any')
url="https://github.com/microchip-pic-avr-tools/pyedbglib"
license=('MIT')
# No handling of LICENSE file because it is included in the wheel
depends=('python-pyserial' 'python-hidapi')
# I skipped Cython because it seems that it is not needed by this very package
# but only by its dependency hidapi. It's then to be included as a dependency of
# python-hidapi package.
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('3fee579bad04c71da85de4a2ec68f6f3d4bd8bacded7fb3b671c8831ed3366c2')
makedepends=('python-installer')

package() {
	python -m installer --destdir="$pkgdir" ${_name}-${pkgver}-py3-none-any.whl
}
