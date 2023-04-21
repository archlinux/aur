pkgname='python-ledger-bitcoin'
_name='ledger_bitcoin'
pkgver='0.1.2'
pkgrel=1
pkgdesc="Client for Ledger Nano Bitcoin application"
url="https://github.com/LedgerHQ/app-bitcoin-new"
depends=('python' 'python-ledgercomm')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
license=('APACHE')
arch=('any')
source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
)
b2sums=(
    'ce86bf1e4b4d12af10053a9dbee2544988f1a04d29ab4f70fe5d45ac7b424d9ef12e034d1c1194d01a58ea1d5587bcf0d46a3748734764aeffc925df502a7870'
)

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
