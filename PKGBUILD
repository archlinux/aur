pkgname=tether-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A Wayland-native local file transfer and clipboard sync tool over mDNS (Binary Release)"
arch=('x86_64')
url="https://github.com/zackb/tether"
license=('MIT')
depends=('gtk3' 'libnotify' 'openssl' 'wayland' 'avahi' 'glib2' 'bluez' 'bluez-utils' 'bluez-obex')
provides=('tether')
conflicts=('tether' 'tether-git')
install=tether.install
source=("${url}/releases/download/v${pkgver}/tether-${pkgver}.tar.gz")
sha256sums=('a6d9323566d42e047336477d4bd425688d0cd87bcc9fa2b4925b09e73d5e37a0')

package() {
    cd "tether-${pkgver}"
    
    # copy files while preserving structure and stripping local ownership
    cp -dr --no-preserve=ownership usr etc "$pkgdir/"
}
