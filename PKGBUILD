# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=goverlay-bin
_pkgver=0_4_3
pkgver=${_pkgver//_/.}
pkgrel=1
pkgdesc="A GUI to help manage Vulkan/OpenGL overlays"
arch=('x86_64')
url="https://github.com/benjamimgois/goverlay"
license=('GPL3')
depends=('qt5pas')
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
        "io.github.benjamimgois.${pkgname%-bin}.desktop"
        "io.github.benjamimgois.${pkgname%-bin}.metainfo.xml"
        "${pkgname%-bin}.png")
sha256sums=('c2965e2d24d864c85afa802aeaaccdfadcf7251893a5052a57d77a19daac7aef'
            '1e69df4f0f1cbc2c8e145fcf709117882d67c1df9e9a39bc9fdd12f68b27be34'
            '1da906fd331214a769e660c0856ab2e902c062b39c85d1a4580f5d30a27ae7d3'
            'a0884484d7c7d07f5cdbffaec1148c4e6e47802afbce26ea69b1bbd40312d578'
            '82baf73d583dd13f1073b2b8d6aa7edc0c558521a46d77bdf1a88cc401e7cc7f')

package() {
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm644 "${pkgname%-bin}.1.gz" -t "$pkgdir/usr/share/man/man1"
	install -Dm644 "io.github.benjamimgois.${pkgname%-bin}.desktop" -t \
		"$pkgdir/usr/share/applications"
	install -Dm644 "io.github.benjamimgois.${pkgname%-bin}.metainfo.xml" -t \
		"$pkgdir/usr/share/metainfo"
	install -Dm644 "${pkgname%-bin}.png" -t "$pkgdir/usr/share/pixmaps"
}
