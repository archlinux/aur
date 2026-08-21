pkgname=tether-bin
pkgver=0.2.8
pkgrel=1
pkgdesc="Bridge an iPhone to the Linux desktop: clipboard, files, messages, and notifications"
arch=('x86_64')
url="https://github.com/zackb/tether"
license=('MIT')
depends=('gtk3' 'libnotify' 'openssl' 'wayland' 'avahi' 'glib2' 'bluez' 'bluez-utils' 'bluez-obex')
provides=('tether')
conflicts=('tether' 'tether-git')
install=tether.install
source=("${url}/releases/download/v${pkgver}/tether-${pkgver}.tar.gz")
sha256sums=('e2fad3cb78a688272e57fe2dd9a262f3389adc727c06797e0a4058841d1f7c59')

package() {
    cd "tether-${pkgver}"
    
    # copy files while preserving structure and stripping local ownership
    cp -dr --no-preserve=ownership usr etc "$pkgdir/"
}
