# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-quantiphy'
_pkgname=${pkgname#python-}
pkgver=2.21
pkgrel=1
pkgdesc="Offers support for the pairing of a number and a unit of measure"
arch=('any')
depends=()
makedepends=(python-build python-installer python-wheel python-flit-core)
url="https://github.com/KenKundert/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('bf8d06ffa7150f69a5c7e3fb4a7a0a535109df85e7c0ab0f39fb317c5c9cafe0')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
