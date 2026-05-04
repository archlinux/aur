pkgname=tether-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="A Wayland-native local file transfer and clipboard sync tool over mDNS (Binary Release)"
arch=('x86_64')
url="https://github.com/zackb/tether"
license=('MIT')
depends=('gtk3' 'libnotify' 'openssl' 'wayland' 'avahi')
provides=('tether')
conflicts=('tether' 'tether-git')
source=("${url}/releases/download/v${pkgver}/tether-${pkgver}.tar.gz")
sha256sums=('b24befdcce376716f0019d4f6cbe2ae0b2fb87a96af6bf74faa407c93bcb05e8')

package() {
    cd "tether-${pkgver}"
    
    # copy files while preserving structure and stripping local ownership
    cp -dr --no-preserve=ownership usr etc "$pkgdir/"
}
