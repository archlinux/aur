pkgname=linux-wallpaper-engine-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Wallpaper Engine for Linux by jagrat7. (Requires linux-wallpaperengine-git)"
arch=('x86_64')
url="https://github.com/jagrat7/linux-wallpaper-engine"
license=('MIT')
options=('!strip' '!debug')
depends=('libxcb' 'mesa' 'libdrm' 'at-spi2-core' 'xdg-utils' 'nss' 'libnotify' 'gtk3' 'linux-wallpaperengine-git')
source=("${url}/releases/download/v0.4.1/linux-wallpaper-engine_${pkgver}_amd64.deb")
sha256sums=('24f5467b00793fc19af0fb7041324b6d556692e3a2dad2a290402f3ebe2a916a')

package() {
    cd "${srcdir}"
    bsdtar -xf data.tar.* -C ${pkgdir}/
    find "${pkgdir}" -type d -exec chmod 755 {} +
    find "$pkgdir/usr/bin" -type f -exec chmod 755 {} + 2>/dev/null || true
}
