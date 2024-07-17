# Maintainer: Simon Brakhane <simon+aur@brakhane.net>
pkgname=ezcoo-cli
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="A tool to control EZCOO KVM switches via the serial interface"
arch=(any)
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
sha256sums=('b743fa0551e29e9a39e4a7d68740e00b604a1fbb74598229d0e4d9a091124de2')
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
