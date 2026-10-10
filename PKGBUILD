# Maintainer: Nk-YMZ <village_flute@outlook.com>

pkgname=molpe-bin
pkgver=1.3.0
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
b2sums_x86_64=('a5eb9a7fbe148a7a21d4e8ea6564deae7ea37c9592b9c5be21cbf1f9a84143589099083309d7d9ce03d1369cc794137af216c6674719cc92e64742d041c26cf0')

package() {
	install -Dm755 "$srcdir/usr/bin/molpe" "$pkgdir/usr/bin/molpe"
	install -Dm644 "$srcdir/usr/lib/systemd/user/molpe.service" \
		"$pkgdir/usr/lib/systemd/user/molpe.service"
	install -Dm644 "$srcdir/usr/share/licenses/molpe/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
