pkgname=tether-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="A Wayland-native local file transfer and clipboard sync tool over mDNS (Binary Release)"
arch=('x86_64')
url="https://github.com/zackb/tether"
license=('MIT')
depends=('gtk3' 'libnotify' 'openssl' 'wayland' 'avahi')
provides=('tether')
conflicts=('tether' 'tether-git')
source=("${url}/releases/download/v${pkgver}/tether-${pkgver}.tar.gz")
sha256sums=('cdd6ddb482b66f84e299fff0d616547f73ed63414ceafb0ac9292dd4a271bf41')

package() {
    cd "tether-${pkgver}"
    
    # copy files while preserving structure and stripping local ownership
    cp -dr --no-preserve=ownership usr etc "$pkgdir/"
}
