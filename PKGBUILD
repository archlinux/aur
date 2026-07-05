# Maintainer: Vicki Pfau (vi@endrift.com)

pkgname=steamos-powerbuttond
_srctag=v3.3
pkgver=${_srctag##v}
pkgrel=1
arch=('x86_64')
url="https://gitlab.steamos.cloud/holo/powerbuttond"
pkgdesc="Power button daemon for SteamOS"
license=('BSD')
depends=('libevdev' 'udev' 'gamescope')
source=("steamos-powerbuttond::git+https://gitlab.com/evlaV/powerbuttond.git#tag=$_srctag")
replaces=('powerbuttond')
conflicts=('powerbuttond')
provides=('powerbuttond')
sha512sums=('fb6c473d697ebd47932157aa1d2cff96f71df64beb0133b50e92987becd651c7b555046b38d472bf565cdba5a6ccbe80290b943638661ad45cda276a3706fefb')

build() {
	make -C "$srcdir/$pkgname"
}

package() {
	make -C "$srcdir/$pkgname" install DESTDIR="$pkgdir"
}
