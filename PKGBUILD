# Maintainer: Carlo Sala <carlosalag@protonmail.com>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

pkgname='python-ledger-bitcoin'
_name='ledger_bitcoin'
pkgver='0.3.0'
pkgrel=2
pkgdesc="Client for Ledger Nano Bitcoin application"
url="https://github.com/LedgerHQ/app-bitcoin-new"
depends=('python' 'python-btchip' 'python-ledgercomm')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
license=('Apache-2.0')
arch=('any')
source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
)
b2sums=('9b82f3687d78b45a040463c2eff0bf71b89be85825a4d7159d9791da631f1c420ddff4e9bfc690d63360ebfc1adb507df625c32e47cf171cbbec06629811d3cf')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
