# Maintainer: Breno Ramalho Lemes <breno@br-lemes.net>
pkgname=kanata-bin
pkgver=1.11.0
pkgrel=1
pkgdesc='Improve keyboard comfort and usability with advanced customization'
arch=('x86_64')
url='https://github.com/jtroo/kanata/'
license=('LGPL-3.0-only')
provides=('kanata')
depends=('gcc-libs' 'glibc')
source=(
	"https://github.com/jtroo/kanata/releases/download/v${pkgver//_/-}/linux-binaries-x64.zip"
	'https://github.com/jtroo/kanata/raw/main/LICENSE'
)
sha256sums=(
	'd9f634afb4c7f078cc2aacf3998fd65b432d4d83296cc48a89f941525459b4e2'
	'a5681bf9b05db14d86776930017c647ad9e6e56ff6bbcfdf21e5848288dfaf1b'
)

package() {
	install -Dm755 "${srcdir}/kanata_linux_x64" "${pkgdir}/usr/bin/kanata"
	install -Dm755 "${srcdir}/kanata_linux_cmd_allowed_x64" "${pkgdir}/usr/bin/kanata_cmd_allowed"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
