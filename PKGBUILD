pkgname=qbittorrent-enhanced-nox-bin
pkgver=4.6.2.10
pkgrel=1
epoch=
pkgdesc="A bittorrent client powered by C++, Qt and the good libtorrent library (Enhanced Edition)"
arch=('x86_64')
url="https://github.com/c0re100/qBittorrent-Enhanced-Edition"
license=('GPL' 'custom')
groups=()
depends=()
makedepends=('unzip')
checkdepends=()
optdepends=()
provides=('qbittorrent-nox')
conflicts=('qbittorrent-nox')
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"$pkgname-$pkgver.zip::https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-$pkgver/qbittorrent-enhanced-nox_x86_64-linux-musl_static.zip"
	"COPYING::https://raw.githubusercontent.com/c0re100/qBittorrent-Enhanced-Edition/v4_6_x/COPYING"
	"COPYING.GPLv2::https://raw.githubusercontent.com/c0re100/qBittorrent-Enhanced-Edition/v4_6_x/COPYING.GPLv2"
	"COPYING.GPLv3::https://raw.githubusercontent.com/c0re100/qBittorrent-Enhanced-Edition/v4_6_x/COPYING.GPLv3"
	"qbittorrent-nox.service"
	"qbittorrent-nox@.service"
	"qbittorrent-nox.sysusers"
	"qbittorrent-nox.tmpfiles"
)
noextract=()
sha256sums=(
	'0855bf0cd8e47003b7b3dda060e21bb0c3960cc0602cffe11dd556f0b0008b2a'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

# build() {
	
# }

package() {
	install -Dm755 "$srcdir"/qbittorrent-nox "$pkgdir"/usr/bin/qbittorrent-nox
	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
	install -Dm644 COPYING.GPLv2 "$pkgdir"/usr/share/licenses/$pkgname/COPYING.GPLv2
	install -Dm644 COPYING.GPLv3 "$pkgdir"/usr/share/licenses/$pkgname/COPYING.GPLv3
	install -Dm644 "$srcdir"/qbittorrent-nox.service "$pkgdir"/usr/lib/systemd/system/qbittorrent-nox.service
	install -Dm644 "$srcdir"/qbittorrent-nox@.service "$pkgdir"/usr/lib/systemd/system/qbittorrent-nox@.service
	install -Dm644 "$srcdir"/qbittorrent-nox.sysusers "$pkgdir"/usr/lib/sysusers.d/qbittorrent-nox.conf
	install -Dm644 "$srcdir"/qbittorrent-nox.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/qbittorrent-nox.conf
}
