pkgname='python-hdwallet'
pkgver='3.6.1'
_src_folder="${pkgname}-${pkgver}"
pkgrel=4
pkgdesc="Python-based library implementing a Hierarchical Deterministic (HD) Wallet generator for 200+ cryptocurrencies."
url="https://hdwallet.io"
depends=('python' 'python-ecdsa' 'python-crcmod' 'python-pycryptodome' 'python-ed25519-blake2b' 'python-coincurve' 'python-pynacl' 'python-base58' 'python-cbor2' 'python-bip38' 'python-pyaes' 'python-click-aliases')

makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:MIT License')
arch=('any')
source=("${_src_folder}.tar.gz::https://github.com/hdwallet-io/python-hdwallet/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('be186aa911c01cd019deae6769bcfae72f07e3d374f64bd6aacfda2e146f79fa')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
