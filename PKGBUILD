# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=goverlay-bin
_id="io.github.benjamimgois.${pkgname%-bin}"
_pkgver=0_6_2
pkgver=${_pkgver//_/.}
pkgrel=1
pkgdesc="A GUI to help manage Vulkan/OpenGL overlays"
arch=('x86_64')
url="https://github.com/benjamimgois/goverlay"
license=('GPL3')
depends=('mangohud' 'qt5pas')
optdepends=('vkbasalt: Configure vkBasalt'
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
sha256sums=('e46ccb180dc99b4bcfed520f21ef2e21477c9f23bec3c1f511e7ce5a9b5915a9'
            '5fc33dc64105c0bb2a3bdbab80e2a556a282da952b3612e21612a043367025f7'
            'b48a7402658d78ea5aeab92bea014d9ab71775a33286633c4a777edcbc289fbf'
            '7828ef36e89e5285e260c36f722838c1f89bce2cd5f21c0c31e2f7dae95cff70'
            '82baf73d583dd13f1073b2b8d6aa7edc0c558521a46d77bdf1a88cc401e7cc7f')

package() {
  install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
  install -Dm644 "${pkgname%-bin}.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm644 "$_id.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "$_id.metainfo.xml" -t "$pkgdir/usr/share/metainfo"
  install -Dm644 "${pkgname%-bin}.png" -t "$pkgdir/usr/share/pixmaps"
}
