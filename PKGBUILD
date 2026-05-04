pkgname=tether-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A Wayland-native local file transfer and clipboard sync tool over mDNS (Binary Release)"
arch=('x86_64')
url="https://github.com/zackb/tether"
license=('MIT')
depends=('gtk3' 'libnotify' 'openssl' 'wayland' 'avahi')
provides=('tether')
conflicts=('tether' 'tether-git')
source=("${url}/releases/download/v${pkgver}/tether-${pkgver}.tar.gz")
sha256sums=('3d86aab1183b1fee66dfd3057997274b44a011ef6ff234991466b65307bad6a5')

package() {
    cd "tether-${pkgver}"
    
    # copy files while preserving structure and stripping local ownership
    cp -dr --no-preserve=ownership usr etc "$pkgdir/"
}
