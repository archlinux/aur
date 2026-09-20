# Maintainer: Nk-YMZ <village_flute@outlook.com>

pkgname=molpe-bin
pkgver=1.1.0
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
b2sums_x86_64=('6f7afe37440114040aa2b3e45333747161db4d8a3c825d3a127360ecd138b564066838287245595eef8e8709f331e245888d76566f02995df856c2c4f2826957')

package() {
	install -Dm755 "$srcdir/usr/bin/molpe" "$pkgdir/usr/bin/molpe"
	install -Dm644 "$srcdir/usr/share/licenses/molpe/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
