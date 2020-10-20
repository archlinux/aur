# Maintainer: Fronkles McFranko <mrelfranko@disroot.org>
pkgname=lisgd
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="Bind gestures on touchscreens, and unsupported gesture devices via libinput touch events"
arch=("any")
url="https://git.sr.ht/~mil/lisgd"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~mil/${pkgname}/archive/${pkgver}.tar.gz"
    "Makefile.patch")
sha1sums=("cae9863918604ffd4c01f2ce30425eecd45c56c9"
    "601e3fa3cf64bc9b5b2509ee60099b95c79979d0")

prepare() {
    patch "$pkgname-$pkgver/Makefile" -i Makefile.patch
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" PREFIX="/usr/" install
}
