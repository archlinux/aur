# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-inform'
_pkgname=${pkgname#python-}
pkgver=1.30
pkgrel=1
pkgdesc="Print and logging utilities for communicating with user"
arch=('any')
depends=(python-six python-arrow)
makedepends=(python-build python-installer python-flit-core)
url="https://github.com/KenKundert/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('9a5808ca048b0b76dad25f3ce2676c734b4e1628e7ea4cdc3a8add69b91a137a')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
