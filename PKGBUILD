# Maintainer: Zosoled

pkgname='python-ragger'
_name=${pkgname#python-}
pkgver=1.40.2
pkgrel=1
pkgdesc='Small wrapper around Speculos, LedgerWallet & LedgerComm to ease instrumentation'
arch=('any')
url='https://github.com/LedgerHQ/ragger'
license=('Apache-2.0')
depends=(
	python
	python-bip_utils
	python-ledgered
	python-mnemonic
	python-py-sr25519-bindings
	python-speculos
	python-toml
	qemu-user-static
)
makedepends=(
	python-installer
)
optdepends=(
	'python-graphviz: Generate dependency diagrams from documentation'
)
source=(
	"${url}/releases/download/v${pkgver}/${_name}-${pkgver}-py3-none-any.whl"
)
sha256sums=(
	'b343742276ae137f74923cad702ab42b285bd2bf2909262339a52400696c780e'
)

package() {
	cd "${srcdir}"
	python -m installer --destdir="${pkgdir}" "${_name}-${pkgver}-py3-none-any.whl"
}
