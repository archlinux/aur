# Maintainer: smlb <smlb at riseup dot net>

pkgname=libthinkpad
pkgver=2.3
pkgrel=2
pkgdesc="A general purpose userspace ThinkPad library"
arch=('i686' 'x86_64')
url="https://github.com/libthinkpad/libthinkpad"
license=('BSD-2')
depends=('cmake' 'systemd')
source=("http://thinkpads.org/ftp/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('da6791c1880e73a43879023c1d7770a3')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make  
    install -Dm755 ./libthinkpad.so "$pkgdir/usr/lib/libthinkpad.so"
    install -Dm755 ./libthinkpad.so.1 "$pkgdir/usr/lib/libthinkpad.so.1"
    install -Dm755 ./libthinkpad.so.2.3 "$pkgdir/usr/lib/libthinkpad.so.2.3"
}

