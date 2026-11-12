# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Rawleenc

pkgname=gnome-shell-extension-resource-monitor
pkgver=30
pkgrel=1
pkgdesc="Monitor the use of system resources like cpu, ram, disk, network and display them in gnome shell top bar"
arch=("any")
url="https://github.com/0ry0n/Resource_Monitor/"
license=('GPL-3.0-or-later')
depends=()
makedepends=('zip' 'unzip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('dd2099695104d2090203fa728fcb8ee8106181cf3df7cb45a8682ed9e7c4068828b4cbe403d2f153b4a5103250de7e6ab6df1c432613087a0ec2b4cf1477606a')

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
