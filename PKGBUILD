# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-shlib'
_pkgname=${pkgname#python-}
pkgver=1.6
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
b2sums=('78a9e9752070318819f805ad893d48e4e1fb4478278d9a36c981f1e9e9daa6784b1ccc0e66c826b73e7f1d5105cd031d975b87fbe1506e86a371b0c59cd9fe75'
        'SKIP')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
