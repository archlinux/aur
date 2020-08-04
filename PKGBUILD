# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=goverlay-bin
_pkgver=0_3_7
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
            'vulkan-tools: Vulkan preview')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$url/releases/download/$pkgver/${pkgname%-bin}_${_pkgver}.tar.xz"
        "${pkgname%-bin}.1.gz"
        "${pkgname%-bin}.desktop"
        "${pkgname%-bin}.metainfo.xml"
        "${pkgname%-bin}.png")
sha256sums=('c52ddb0461750e28a8d4f25769e5681513a522e70d44b085bc0d58a721e0327d'
            '1e69df4f0f1cbc2c8e145fcf709117882d67c1df9e9a39bc9fdd12f68b27be34'
            'c7903e55d62e74f2993faefc628c3f5cb923e83ed79baf4ea9804b33048397c2'
            '743e063ecc298b63ee7b0e25ac3f07fc4ecd713be7c8a3cb437aa9c07949cbdf'
            '82baf73d583dd13f1073b2b8d6aa7edc0c558521a46d77bdf1a88cc401e7cc7f')

package() {
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm644 "${pkgname%-bin}.1.gz" -t "$pkgdir/usr/share/man/man1"
	install -Dm644 "${pkgname%-bin}.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 "${pkgname%-bin}.metainfo.xml" -t "$pkgdir/usr/share/metainfo"
	install -Dm644 "${pkgname%-bin}.png" -t "$pkgdir/usr/share/pixmaps"
}
