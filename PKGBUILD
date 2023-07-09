pkgname='python-ledger-bitcoin'
_name='ledger_bitcoin'
pkgver='0.2.2'
pkgrel=1
pkgdesc="Client for Ledger Nano Bitcoin application"
url="https://github.com/LedgerHQ/app-bitcoin-new"
depends=('python' 'python-bip32' 'python-coincurve' 'python-ledgercomm')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
license=('APACHE')
arch=('any')
source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
)
b2sums=(
    '030cd888458fe9c80e9eb31b2c1489eb6f7d1aa7df2f0d4a4d822db94fdc932ade47c429fed6865b70015ba4b2ef3e864bee4b252cbaac801b11126dde2b5ad6'
)

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
