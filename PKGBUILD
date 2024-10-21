# Maintainer: jakob <grandchild@gmx.net>

_pkgname=pycookiecheat
pkgname=python-${_pkgname}
pkgver=0.7.0
pkgrel=1
pkgdesc="Borrow cookies from your browser's authenticated session"
arch=(any)
url="https://github.com/n8henrie/${_pkgname}"
license=('MIT')
depends=(python python-{cryptography,keyring})
makedepends=(python-{build,installer,wheel,setuptools-scm})
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('b29a03d6bdb29f9e581c3712d74ec5a04cdc9254289ac880a8884f03471ef975')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
