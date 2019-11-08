# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=ooniprobe-desktop-bin
pkgver=3.0.0.rc.1
_pkgver=3.0.0-rc.1
pkgrel=1
pkgdesc="The next generation OONI Probe desktop app"
arch=('x86_64')
url="https://github.com/ooni/probe-desktop"
license=('MIT')
depends=('gconf' 'libnotify' 'libappindicator-gtk2' 'libxtst' 'nss' 'libxss')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/ooni/probe-desktop/releases/download/v$_pkgver/${pkgname%-bin}_${_pkgver}_amd64.deb")
sha256sums=('38fe43afae8dc03f575ac6eb14018a084d87d092523c82f24967cc632a25ff9f')

package() {
	tar -xvf data.tar.xz -C "$pkgdir"
	
	# Link to the binary
	install -dm755 "$pkgdir/usr/bin"
	ln -sf "/opt/OONI Probe/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
}
