# Maintainer: Carlo Sala <carlosalag@protonmail.com>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

pkgname='python-ledger-bitcoin'
_name='ledger_bitcoin'
pkgver='0.4.0'
pkgrel=3
pkgdesc="Client for Ledger Nano Bitcoin application"
url="https://github.com/LedgerHQ/app-bitcoin-new"
depends=('python' 'python-ledgercomm' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
license=('Apache-2.0')
arch=('any')
source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
)
b2sums=('066c1df0c19a007cef8837a61e66366ab6cc10ad0aff79cc0eab5a38fe4ee9414189d9424ec6a58e138e26c1a220e4673e27cb657fa06922fa738428ff74bdfc')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
