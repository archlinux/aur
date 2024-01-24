pkgname=qbittorrent-enhanced-nox-bin
pkgver=4.6.3.10
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
sha256sums=('3c6bf0fe789b465aae78458c80c069ab30b078ae29ffbcf7ca420b9542e1fa60'
            'e675cd856f9817474455200ba7e6f5b7cc42d6598a5eecbbbdaa0e6fd304d6b7'
            '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '1abf767c45501f987dbac764186f7bce51da11b09efed9e0ac9d52258828af28'
            '05fed0075716b556dfdfb39d811a2d9a2e3daabcae3f3a3d15947d15e86013c4'
            '4d7b6b7b60390043f57d8a1efcf7c4056ff0c1f6dc833159505eeb05a5de86d3'
            '6fc0057b9bfa88d77db962885395e22bf5abc6625c908db4cb773b29e56afc9a')

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
