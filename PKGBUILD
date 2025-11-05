# Maintainer: Zosoled

pkgname='python-speculos'
_name=${pkgname#python-}
pkgver=0.25.8
pkgrel=1
pkgdesc='Ledger hardware wallet emulator'
arch=('x86_64')
url='https://github.com/LedgerHQ/speculos'
license=('GPL-3.0')
depends=(
	'python>=3.9'
	'python-construct'
	'python-flask'
	'python-flask-cors'
	'python-flask-restful'
	'python-jsonschema'
	'python-ledgered'
	'python-mnemonic'
	'python-pillow'
	'python-pyelftools'
	'python-pygame'
	'python-pyqt6'
	'python-requests'
	'qemu-user-static'
)
makedepends=(
	'python-installer'
)
source=(
	"${url}/releases/download/v${pkgver}/${_name}-${pkgver}-py3-none-any.whl"
)
sha256sums=(
	'bdbb69158f6f81db8fe3ef8379de46bced96867ce8728ae9dd0a34a5d7648cd3'
)

package() {
	cd "${srcdir}"
	python -m installer --destdir="${pkgdir}" "${_name}-${pkgver}-py3-none-any.whl"
}
