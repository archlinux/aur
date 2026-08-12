# Maintainer: L1bT0rch <L1bT0rch@proton.me>
# Contributor: Vicki Pfau (vi@endrift.com)

pkgname=steamos-powerbuttond
_srctag=v4.2
pkgver=${_srctag##v}
pkgrel=1
arch=('x86_64')
url="https://gitlab.steamos.cloud/holo/powerbuttond"
pkgdesc="Power button daemon for SteamOS"
license=('BSD-2-Clause')
depends=('libevdev' 'udev' 'gamescope')
source=("steamos-powerbuttond::git+https://gitlab.steamos.cloud/holo/powerbuttond.git#tag=$_srctag")
replaces=('powerbuttond')
conflicts=('powerbuttond')
provides=('powerbuttond')
sha512sums=('SKIP')

build() {
	make -C "$srcdir/$pkgname"
}

package() {
	make -C "$srcdir/$pkgname" install DESTDIR="$pkgdir"
}
