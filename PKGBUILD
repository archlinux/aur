# Maintainer: jakob <grandchild@gmx.net>

_pkgname=pycookiecheat
pkgname=python-${_pkgname}
pkgver=0.5.0
pkgrel=2
pkgdesc="Borrow cookies from your browser's authenticated session"
arch=(any)
url="https://github.com/n8henrie/${_pkgname}"
license=('MIT')
depends=(python python-{cryptography,keyring})
makedepends=(python-{build,installer,wheel,setuptools-scm})
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('986bfb33ed921a97a20c3af64da3c55b76f634616a12d4a1097a7ec1d4ea0699')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
