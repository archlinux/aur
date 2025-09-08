# Maintainer: Simon Brakhane <simon+aur@brakhane.net>
pkgname=ezcoo-cli
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="A tool to control EZCOO KVM switches via the serial interface"
arch=(any)
url="https://github.com/luminger/ezcoo-cli"
license=(Apache)
groups=()
depends=(python-pyserial python-attrs python-click)
makedepends=(python-poetry-core python-build python-installer python-wheel)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/luminger/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9f88c5eec63b5fcb896f8dec995016c0f165c3e7cacb7f487c6506f02e443d94')
noextract=()
md5sums=()
validpgpkeys=()

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
