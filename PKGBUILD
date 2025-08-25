# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-shlib'
_pkgname=${pkgname#python-}
pkgver=1.8
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
b2sums=('ce71e5e917d82ec8b5c7f1aae68a0ba8dcbff235c7abe3390464455c6d39180f7c95a9b92ba218bbb11b2ef4eaa8fd8f2f45f9d325f05319a217e1c73a6d2996'
        'SKIP')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
