# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-shlib'
_pkgname=${pkgname#python-}
pkgver=1.8.1
pkgrel=1
pkgdesc="A light-weight library to do shell-script like things with Python"
arch=('any')
makedepends=(python-build python-installer python-flit-core)
optdepends=(python-braceexpand python-inform)
url="https://github.com/KenKundert/$_pkgname"
license=('GPL3')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
        "$url/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz.asc")
validpgpkeys=('4A47DE443CEE6D70A892347A9B8FFF1D3E1C0A50')
b2sums=('9afc9b4f7e3fa7e705b06be8d82579ed85b743ff8c3d96f49b1d5bcf507623f3eed6876be9900320f0fecbca36e98c6a7b6af401f917114abbb520f90d25c05e'
        'SKIP')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
