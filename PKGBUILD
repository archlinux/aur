pkgname=tether-bin
pkgver=0.3.6
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
sha256sums=('69ae6efa16dc50b0fdee968c6a2b74ccb8e4d673712b4ba104a68f0f0b18a1a1')

package() {
    cd "tether-${pkgver}"
    
    # copy files while preserving structure and stripping local ownership
    cp -dr --no-preserve=ownership usr etc "$pkgdir/"
}
