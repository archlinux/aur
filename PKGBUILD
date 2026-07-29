# Maintainer: Tom Genco <tom at tomgenco dot com>

pkgname=tc2-launcher-bin
_pkgname=tc2-launcher
pkgver=1.1.3
pkgrel=1
pkgdesc="Manages downloading and launching Team Comtress 2 (TC2)"
arch=('x86_64')
license=('MIT')
url="https://github.com/mastercomfig/tc2-launcher"
depends=(
	'glibc'
	'zlib'
)
provides=('tc2-launcher')
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("$url/releases/download/$pkgver/TC2Launcher-linux"
        "$_pkgname.desktop"
        "$_pkgname.png"
        'LICENSE')
sha256sums=('0e0ee7d0125c8e3e5fb979376c3e5976a5cc08f95b63d5527048136d710e1b19'
						'SKIP'
						'SKIP'
            'SKIP')

package() {
	install -Dm755 TC2Launcher-linux -t "$pkgdir/usr/bin/"
	install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm644 "$_pkgname.png" -t "$pkgdir/usr/share/pixmaps/"
	install -Dm644 "$_pkgname.png" -t "$pkgdir/usr/share/icons/hicolor/192x192/apps/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
