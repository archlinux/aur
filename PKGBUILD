pkgname=hackernel
pkgver=1.7.1
pkgrel=2
pkgdesc="Host Intrusion Detection and Prevention System"
url="https://github.com/lanthora/hackernel"
license=('GPL')
arch=('x86_64' 'armv7h' 'aarch64')
source=("https://github.com/lanthora/hackernel/archive/refs/tags/v$pkgver.tar.gz" )
sha256sums=('4f2072288ad162fef5eeac0c9ce06e61060415cc4c38fd6738b2f27c2642d084')
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
