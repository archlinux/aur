pkgname=tether-bin
pkgver=0.3.7
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
sha256sums=('57432805841d6063b8745e06d838f12d125da89ff3bc25cceae818eccb58d89d')

package() {
    cd "tether-${pkgver}"
    
    # copy files while preserving structure and stripping local ownership
    cp -dr --no-preserve=ownership usr etc "$pkgdir/"
}
