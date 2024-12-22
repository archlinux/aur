# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=pyDes
pkgname=python-pydes
_commit=e988a5ffc9abb8010fc75dba54904d1c5dbe83db
pkgver=2.0.1
pkgrel=5
pkgdesc="Pure python implementation of DES and TRIPLE DES encryption algorithm"
arch=(any)
url=https://github.com/twhiteman/pyDes
license=(MIT)
depends=(python)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools
    python-wheel
)
source=($_pkgname::git+https://github.com/twhiteman/pyDes#commit=$_commit)
b2sums=('5c717ca1d8600403a2c6c36134001b9fbd211b9bb74580a697e8434c51ddacbbf661ae1df6bec2cf1871244fe88c6f7ecf24711c26ed97c2e1f51b3215f5c8cf')

build() {
    cd $_pkgname
    python -m build --wheel --no-isolation
}

package() {
    cd $_pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
