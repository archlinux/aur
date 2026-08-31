pkgname=tether-bin
pkgver=0.2.19
pkgrel=2
pkgdesc="Bridge an iPhone to the Linux desktop: clipboard, files, messages, and notifications"
arch=('x86_64')
url="https://github.com/zackb/tether"
license=('MIT')
depends=('gtk3' 'gtk-layer-shell' 'libnotify' 'openssl' 'wayland' 'avahi' 'glib2' 'bluez' 'bluez-utils' 'bluez-obex')
provides=('tether')
conflicts=('tether' 'tether-git')
install=tether.install
source=("${url}/releases/download/v${pkgver}/tether-${pkgver}.tar.gz")
sha256sums=('a71831bca603b02f4e3d947be344319afab77dca71827099deb4db7c97737174')

package() {
    cd "tether-${pkgver}"
    
    # copy files while preserving structure and stripping local ownership
    cp -dr --no-preserve=ownership usr etc "$pkgdir/"
}
