pkgname=linux-wallpaper-engine-bin
pkgver=0.4.2
pkgrel=2
pkgdesc="Wallpaper Engine for Linux by jagrat7. (Requires linux-wallpaperengine-git)"
arch=('x86_64')
url="https://github.com/jagrat7/linux-wallpaper-engine"
license=('MIT')
options=('!strip' '!debug')
depends=('libxcb' 'mesa' 'libdrm' 'at-spi2-core' 'xdg-utils' 'nss' 'libnotify' 'gtk3' 'linux-wallpaperengine-git')
source=("${url}/releases/download/v${pkgver}/linux-wallpaper-engine_${pkgver}_amd64.deb")
sha256sums=('49a033fa1cd147604c359b2b54a27262d75e066ba0d7980cf2e5fcb632465bc1')

package() {
    cd "${srcdir}"
    bsdtar -xf data.tar.* -C ${pkgdir}/
    find "${pkgdir}" -type d -exec chmod 755 {} +
    find "$pkgdir/usr/bin" -type f -exec chmod 755 {} + 2>/dev/null || true
}
