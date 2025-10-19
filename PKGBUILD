# Maintainer: Simon Brakhane <simon+aur@brakhane.net>
pkgname=ezcoo-cli
pkgver=0.2.0
pkgrel=1
epoch=
pkgdesc="A tool to control EZCOO KVM switches via the serial interface"
arch=(any)
url="https://github.com/luminger/ezcoo-cli"
license=(GPL-3.0-or-later)
groups=()
depends=(python-pyserial python-click)
makedepends=(python-hatchling python-build python-installer python-wheel)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/luminger/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ff4400a8d460e28d06e0de070e7b832255c807328d28950f26becceae3fbeed9')
noextract=()
validpgpkeys=()

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
