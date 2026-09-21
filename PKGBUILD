# Maintainer: Nk-YMZ <village_flute@outlook.com>

pkgname=molpe-bin
pkgver=1.1.1
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
b2sums_x86_64=('1772c34153d8152c51a58fe2a893a63ec27502f910ded355ceb6d8da189c1298871af5afdd497148ba78cad0040ebe403c8ab619acbf530e82cfb77a06c5928d')

package() {
	install -Dm755 "$srcdir/usr/bin/molpe" "$pkgdir/usr/bin/molpe"
	install -Dm644 "$srcdir/usr/share/licenses/molpe/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
