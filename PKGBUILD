# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=goverlay-bin
_pkgver=0_4_1
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
sha256sums=('28f0bffa2d197718d95fbca5e209265bd7339eee91e68e4ee8d80360e022b288'
            '1e69df4f0f1cbc2c8e145fcf709117882d67c1df9e9a39bc9fdd12f68b27be34'
            '953f1df218ec72c5ddfaaf6525472064526962d4e3ccc759998bdb4f8a543ce9'
            'd310e990a6ecc8ea993462293ab98d69724523ac4ad85a78bcf1c91cbf5c36a1'
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
