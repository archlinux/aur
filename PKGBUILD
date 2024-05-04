# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

pkgname=mdns-scan
pkgver=0.5
pkgrel=6
pkgdesc="Scan mDNS/DNS-SD published services on the local network"
arch=("x86_64")
url="http://0pointer.de/lennart/projects/mdns-scan/"
license=("GPL-2.0-only")
depends=("glibc")
source=("http://0pointer.de/lennart/projects/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('318ee5560f9973c663d4a319182715c1452adf593c281df404dab9c87e4b0ea872e0cae1cd801a4e9b9f03019222b8969f4f70eeee7e1c3e2fa941ff7f3324a8')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 mdns-scan   "$pkgdir"/usr/bin/mdns-scan
    install -Dm644 mdns-scan.1 "$pkgdir"/usr/share/man/man1/mdns-scan.1
}
