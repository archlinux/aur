# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-quantiphy'
_pkgname=${pkgname#python-}
pkgver=2.19
pkgrel=1
pkgdesc="Offers support for the pairing of a number and a unit of measure"
arch=('any')
depends=()
makedepends=(python-build python-installer python-wheel python-flit-core)
url="https://github.com/KenKundert/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('9dc004a1047948a6e50d783f6f443e1e4d988fc1a44ca1d2b4821d1e96fb935a')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
