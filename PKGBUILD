# Maintainer: Nk-YMZ <village_flute@outlook.com>

pkgname=molpe-bin
pkgver=1.2.0
pkgrel=1
pkgdesc='Linux 终端中的网易云音乐 TUI 播放器（预编译版本）'
arch=('x86_64')
url='https://github.com/Nk-YMZ/Molpe'
license=('MIT')
depends=('glibc' 'mpv')
provides=("molpe=${pkgver}")
conflicts=('molpe')
options=('!strip' '!debug')
source_x86_64=("${url}/releases/download/v${pkgver}/molpe-${pkgver}-1-${CARCH}.pkg.tar.zst")
b2sums_x86_64=('c22b7131a580ee928d18288924f0aa05afaea953def0c64225dafb08442efafe7031c53f0ed56d7a0091f8958bac46652711d7d063c2e1064a86bbc991be05e0')

package() {
	install -Dm755 "$srcdir/usr/bin/molpe" "$pkgdir/usr/bin/molpe"
	install -Dm644 "$srcdir/usr/lib/systemd/user/molpe.service" \
		"$pkgdir/usr/lib/systemd/user/molpe.service"
	install -Dm644 "$srcdir/usr/share/licenses/molpe/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
