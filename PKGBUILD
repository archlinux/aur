# Maintainer: Simon Brakhane <simon+aur@brakhane.net>
pkgname=ezcoo-cli
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="A tool to control EZCOO KVM switches via the serial interface"
arch=(x86_64)
url="https://github.com/luminger/ezcoo-cli"
license=(Apache)
groups=()
depends=(python-pyserial python-attrs python-click)
makedepends=(python-build python-installer python-wheel)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/luminger/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e457fda58532d0fe49a3804b8a446cb68c5c8dc48b72bf153fbad8e8e25a7f56')
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
