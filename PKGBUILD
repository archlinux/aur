pkgname=tether-bin
pkgver=0.2.42
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
sha256sums=('7512c511a771798b21258206ea204d1cc84abc0dc97a53c7083863d023a26665')

package() {
    cd "tether-${pkgver}"
    
    # copy files while preserving structure and stripping local ownership
    cp -dr --no-preserve=ownership usr etc "$pkgdir/"
}
