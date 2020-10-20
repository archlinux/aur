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
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~mil/lisgd/archive/0.1.1.tar.gz"
    "Makefile.patch")
md5sums=("088a38d9938e46829295f17294158c1d" "SKIP")

prepare() {
    patch "$pkgname-$pkgver/Makefile" -i Makefile.patch
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" PREFIX="/usr/" install
}
