pkgname=tether-bin
pkgver=0.2.6
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
sha256sums=('f4bc304907295fdb4de07180f694f103a6ef193e458b791b163ba018e0ccd3d8')

package() {
    cd "tether-${pkgver}"
    
    # copy files while preserving structure and stripping local ownership
    cp -dr --no-preserve=ownership usr etc "$pkgdir/"
}
