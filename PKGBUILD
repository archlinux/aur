# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="goofcord-bin"
pkgver=0.6.0
pkgrel=1
pkgdesc="Take control of your Discord experience with GoofCord – the highly configurable and privacy first discord client."
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/Milkshiift/GoofCord"
license=("OSL3")
depends=('libxcomposite' 'libxfixes' 'libcups' 'hicolor-icon-theme' 'libxcb' 'libx11' 'mesa' 'nspr' 'libxkbcommon' 'nss' 'expat' \
    'gtk3' 'libxdamage' 'glibc' 'libdrm' 'dbus' 'at-spi2-core' 'pango' 'gcc-libs' 'cairo' 'libxext' 'alsa-lib' 'glib2' 'libxrandr')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/GoofCord_${pkgver}_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/GoofCord_${pkgver}_armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/GoofCord_${pkgver}_amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/Milkshiift/GoofCord/main/LICENSE")
sha256sums=('4e7f66aa93929feee2db20f14f871e7ddcc69236b0ecfb79a19ade9b859daf51')
sha256sums_aarch64=('585c34d6fee007cc9f12d7d6e9eeb70c05457e5ec3d9a048b364ccfa3abffe0d')
sha256sums_armv7h=('a3bc82d61f226630d32e82329731f629722d969b68c1a710d4bdfda9f4168c3b')
sha256sums_x86_64=('fcdc507b5bbf41e4b02d0bcc47c694150fb088ab63aa31864a4c6a7702b0333a')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}