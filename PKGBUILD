pkgname=warp-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A live wallpaper daemon and client for Wayland (Pre-compiled)"
arch=('x86_64')
url="https://codeberg.org/nimirus/warp"
license=('MIT')
depends=('wayland' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-libav')
provides=('warp' 'warp-daemon' 'warp-client')
conflicts=('warp' 'warp-daemon' 'warp-client')
source=("${url}/releases/download/v${pkgver}/warp-linux-amd64.tar.gz")
sha256sums=('6d6b928171fb0c7cb5c2416d5d16afcb86f9006499acdc52fbf6ef1dc8e1cf0e')

package() {
    cd "${srcdir}"
    
    install -Dm755 warp-daemon "${pkgdir}/usr/bin/warp-daemon"
    install -Dm755 warp-client "${pkgdir}/usr/bin/warp-client"
    install -Dm644 warp-daemon.service "${pkgdir}/usr/lib/systemd/user/warp-daemon.service"
}
