pkgname='python-ledger-bitcoin'
_name='ledger_bitcoin'
pkgver='0.2.1'
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
    '0da69ef1cb5700f17a1443a8698546aa8dada5189384c59bfaff2dc4c6bc861eb6227e8c984e62922c7777bf62b524491239f0bc1b9d4dd3a45922a8116e007c'
)

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
