pkgname=linux-wallpaper-engine-bin
pkgver=0.4.3
pkgrel=2
pkgdesc="Wallpaper Engine for Linux by jagrat7. (Requires linux-wallpaperengine-git)"
arch=('x86_64')
url="https://github.com/jagrat7/linux-wallpaper-engine"
license=('MIT')
options=('!strip' '!debug')
depends=('libxcb' 'mesa' 'libdrm' 'at-spi2-core' 'xdg-utils' 'nss' 'libnotify' 'gtk3' 'linux-wallpaperengine')
source=("${url}/releases/download/v${pkgver}/linux-wallpaper-engine_${pkgver}_amd64.deb")
sha256sums=('bbd92ed9065ca3054a81cd1287336db83fcda89ba2fce6bfc373d22084467668')

package() {
    cd "${srcdir}"
    bsdtar -xf data.tar.* -C ${pkgdir}/
    find "${pkgdir}" -type d -exec chmod 755 {} +
    find "$pkgdir/usr/bin" -type f -exec chmod 755 {} + 2>/dev/null || true
}
