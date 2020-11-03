# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=goverlay-bin
_pkgver=0_4
pkgver=${_pkgver//_/.}
pkgrel=1
pkgdesc="A GUI to help manage Vulkan/OpenGL overlays"
arch=('x86_64')
url="https://github.com/benjamimgois/goverlay"
license=('GPL3')
depends=('gtk2')
optdepends=('mangohud: Configure MangoHUD'
            'vkbasalt: Configure vkBasalt'
            'mesa-demos: OpenGL preview'
            'vulkan-tools: Vulkan preview'
            'git: Clone reshade repository'
            'replay-sorcery: Instant replay solution')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$url/releases/download/$pkgver/${pkgname%-bin}_${_pkgver}.tar.xz"
        "${pkgname%-bin}.1.gz"
        "${pkgname%-bin}.desktop"
        "${pkgname%-bin}.metainfo.xml"
        "${pkgname%-bin}.png")
sha256sums=('f2549d200b4408d83789be9b2f545970f496672d4f7a80d395ed6852d3e05f45'
            '1e69df4f0f1cbc2c8e145fcf709117882d67c1df9e9a39bc9fdd12f68b27be34'
            '614ce62179b2e6f170de1422a8125de27b11215dc698fa8b2ade02f99ef6dfca'
            '8874342a77b7a36dfa4e9e8da6ce0eaa5e437fe68d2f78cc5f056d41720b794c'
            '82baf73d583dd13f1073b2b8d6aa7edc0c558521a46d77bdf1a88cc401e7cc7f')

package() {
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm644 "${pkgname%-bin}.1.gz" -t "$pkgdir/usr/share/man/man1"
	install -Dm644 "${pkgname%-bin}.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 "${pkgname%-bin}.metainfo.xml" -t "$pkgdir/usr/share/metainfo"
	install -Dm644 "${pkgname%-bin}.png" -t "$pkgdir/usr/share/pixmaps"
}
