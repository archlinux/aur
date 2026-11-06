pkgname=tether-bin
pkgver=0.3.4
pkgrel=1
pkgdesc="Bridge an iPhone to the Linux desktop: clipboard, files, messages, and notifications"
arch=('x86_64')
url="https://github.com/zackb/tether"
license=('MIT')
depends=('gtk3' 'gtk-layer-shell' 'libnotify' 'ncurses' 'openssl' 'wayland' 'avahi' 'glib2' 'libsecret' 'bluez' 'bluez-utils' 'bluez-obex' 'ffmpeg' 'pipewire')
provides=('tether')
conflicts=('tether' 'tether-git')
install=tether.install
source=("${url}/releases/download/v${pkgver}/tether-${pkgver}.tar.gz")
sha256sums=('fa8304e1dbb0ac25c2d1659d12649cbc489d66853d4461c7d32ee72b586804ac')

package() {
    cd "tether-${pkgver}"
    
    # copy files while preserving structure and stripping local ownership
    cp -dr --no-preserve=ownership usr etc "$pkgdir/"
}
