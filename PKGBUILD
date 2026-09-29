# Maintainer: Carlo Sala <carlosalag@protonmail.com>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

pkgname='python-ledger-bitcoin'
_name='ledger_bitcoin'
pkgver='0.4.1'
pkgrel=1
pkgdesc="Client for Ledger Nano Bitcoin application"
url="https://github.com/LedgerHQ/app-bitcoin-new"
depends=('python' 'python-ledgercomm' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
license=('Apache-2.0')
arch=('any')
source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
)
sha256sums=('3cb4297ed7e557ef98349cdcbd667ef7368c047d6818c7cdcbca7af98b8006b6')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
