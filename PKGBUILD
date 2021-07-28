# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=goverlay-bin
_id="io.github.benjamimgois.${pkgname%-bin}"
_pkgver=0_6_1
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
        "$_id.desktop"
        "$_id.metainfo.xml"
        "${pkgname%-bin}.png")
sha256sums=('48850ba49d736412a6b5c13c109e181ce0a50bf3ea2a2ac91116790da794b1bc'
            '5fc33dc64105c0bb2a3bdbab80e2a556a282da952b3612e21612a043367025f7'
            '1da906fd331214a769e660c0856ab2e902c062b39c85d1a4580f5d30a27ae7d3'
            '7828ef36e89e5285e260c36f722838c1f89bce2cd5f21c0c31e2f7dae95cff70'
            '82baf73d583dd13f1073b2b8d6aa7edc0c558521a46d77bdf1a88cc401e7cc7f')

package() {
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm644 "${pkgname%-bin}.1" -t "$pkgdir/usr/share/man/man1"
	install -Dm644 "$_id.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 "$_id.metainfo.xml" -t "$pkgdir/usr/share/metainfo"
	install -Dm644 "${pkgname%-bin}.png" -t "$pkgdir/usr/share/pixmaps"
}
