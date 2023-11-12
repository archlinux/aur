pkgname=hackernel
pkgver=1.7.3
pkgrel=1
pkgdesc="Host Intrusion Detection and Prevention System"
url="https://github.com/lanthora/hackernel"
license=('GPL')
arch=('x86_64' 'armv7h' 'aarch64')
source=("https://github.com/lanthora/hackernel/archive/refs/tags/v$pkgver.tar.gz" )
sha256sums=('a199f215136c6b2d31d432242732efc66c93ca940c22adde90695929c3afffbd')
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
