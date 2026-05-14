# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Rawleenc

pkgname=gnome-shell-extension-resource-monitor
pkgver=28
pkgrel=1
pkgdesc="Monitor the use of system resources like cpu, ram, disk, network and display them in gnome shell top bar"
arch=("any")
url="https://github.com/0ry0n/Resource_Monitor/"
license=('GPL-3.0-or-later')
depends=()
makedepends=('zip' 'unzip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('1908d316fd820c408a3733028723d45f9b9dd5a59dc77a6526aa135a1dc97f91d1930a74a7563b0e3929d7b518d46f2303cbf434dbd43b9f47ce4685fbccd526')

_srcdir="Resource_Monitor-$pkgver"

build() {
  cd "${_srcdir}"
  make package
}

package() {
	depends+=('gnome-shell')

	install -d "$pkgdir/usr/share/gnome-shell/extensions"
	unzip "${_srcdir}/build/Resource_Monitor@Ory0n.zip" -d "$pkgdir/usr/share/gnome-shell/extensions"
}
