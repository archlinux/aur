# Maintainer: Antonio Cardace <anto.cardace@gmail.com>
pkgname=liblwipv6
pkgver=1.5a
pkgrel=2
pkgdesc="User level (lightweight) TCP/IP stack with IPv6 support."
arch=('x86_64')
url="https://sourceforge.net/projects/view-os"
license=('GPL2')
depends=('glibc>=2.17'
         'libpcap>=0.8')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname")
replaces=("$pkgname")
install="${pkgname}.install"
source=("http://ftp.us.debian.org/debian/pool/main/l/lwipv6/liblwipv6-2_1.5a-2_amd64.deb"
        "${pkgname}.install")
md5sums=("256c6a739c765988eafdd347f174635d"
         "b4165e6142a92d65c8e14479486decc4")

prepare() {
   cd "$srcdir"
   tar -xf data.tar.gz
}

package() {
   cp -r "${srcdir}/usr" "$pkgdir"
}
