pkgname=hackernel
pkgver=1.7.4
pkgrel=1
pkgdesc="host intrusion detection and prevention system"
url="https://github.com/lanthora/hackernel"
license=('GPL')
arch=('x86_64' 'armv7h' 'aarch64')
source=("https://github.com/lanthora/hackernel/archive/refs/tags/v$pkgver.tar.gz" )
sha256sums=('6ff0a8098629fb75fa253c3657f7586a529727401b98053b329c14f31a715abd')
depends=('dkms' 'libnl')
makedepends=('cmake' 'make' 'go' 'nlohmann-json' 'nodejs' 'npm')
backup=('etc/hackernel/telegram.yaml' 'etc/hackernel/web.yaml')

build() {
        cd "$pkgname-$pkgver"
        make arch-build
}

package() {
        cd "$pkgname-$pkgver"
        make DESTDIR="$pkgdir/" arch-install
}
