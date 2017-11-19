# Maintainer: smlb <smlb at riseup dot net>

pkgname=dockd
pkgver=1.20
pkgrel=2
pkgdesc="A general purpose userspace ThinkPad library"
arch=('i686' 'x86_64')
url="https://github.com/libthinkpad/dockd"
license=('BSD-2')
depends=('cmake' 'systemd' 'libthinkpad' 'libsystemd' 'libxrandr')
source=("http://thinkpads.org/ftp/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('a3606e57095cd536d636edc7541af9f4')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || exit 1 
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make 
    install -Dm644 ./${pkgname}.desktop -t "${pkgdir}"/usr/share/applications
    install -Dm755 ./dockd "$pkgdir/usr/bin/$pkgname"
}

