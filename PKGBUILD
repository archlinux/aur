pkgname=hackernel
pkgver=1.7.2
pkgrel=1
pkgdesc="Host Intrusion Detection and Prevention System"
url="https://github.com/lanthora/hackernel"
license=('GPL')
arch=('x86_64' 'armv7h' 'aarch64')
source=("https://github.com/lanthora/hackernel/archive/refs/tags/v$pkgver.tar.gz" )
sha256sums=('8ffa2dc5705d49218304cc8d539b57f200ea483766219d99654ca6fa58ad28a6')
depends=('dkms' 'libnl')
makedepends=('cmake' 'make' 'go' 'nlohmann-json')
backup=('etc/hackernel/telegram.yaml' 'etc/hackernel/web.yaml')

build() {
        cd "$pkgname-$pkgver"
        make arch-build
}

package() {
        cd "$pkgname-$pkgver"
        make DESTDIR="$pkgdir/" arch-install
}
