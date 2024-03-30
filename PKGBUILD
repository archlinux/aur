pkgname=hackernel
pkgver=1.7.5
pkgrel=1
pkgdesc="host intrusion detection and prevention system"
url="https://github.com/lanthora/hackernel"
license=('GPL')
arch=('x86_64' 'armv7h' 'aarch64')
source=(https://github.com/lanthora/hackernel/archive/refs/tags/v$pkgver.tar.gz)

sha256sums=('fbcea470ffc414703e39c0898546c46908c227ba358056153566712cbe933076')

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
