# Maintainer: Nk-YMZ <village_flute@outlook.com>

pkgname=molpe-bin
pkgver=1.4.0
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
b2sums_x86_64=('38b31a49c984ec317fa62ab2c1c1c84aefa986b88cca1c18c75fd9d43c3d332a0cf595e8b88c1b8dac590ceeb689dc00c6597fa3d594f194293526c1e21ac8d7')

package() {
	install -Dm755 "$srcdir/usr/bin/molpe" "$pkgdir/usr/bin/molpe"
	install -Dm644 "$srcdir/usr/lib/systemd/user/molpe.service" \
		"$pkgdir/usr/lib/systemd/user/molpe.service"
	install -Dm644 "$srcdir/usr/share/licenses/molpe/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
