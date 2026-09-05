# Maintainer: Samueru-sama xdglawyer@outlook.com
pkgname=12to11
pkgver=1.0.0
pkgrel=2
pkgdesc="Tool for running Wayland applications on an X server"
arch=('x86_64')
url="https://github.com/fish4terrisa-MSDSM/12to11"
license=('GPL-3.0-or-later')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/fish4terrisa-MSDSM/12to11/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
	'f6d142b65548263957f9394ae12e0971b887b99759f42e093cf906035a639e5b'
)
makedepends=(make)
provides=('12to11-git')
conflicts=('12to11-git')
depends=(
	wayland pixman libx11 libxi libxkbfile libglvnd
	libxrandr libxcb libdrm libxshmfence libxpresent
)

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX=/usr ANALYZE=0
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}
