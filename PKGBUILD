# Maintainer: Clayton Craft <clayton@craftyguy.net>
pkgname=keyboard_latency
pkgver=1.0
pkgrel=1
pkgdesc="Daemon for resolving keyboard lag issues on Dell XPS 13 laptops"
arch=('i686' 'x86_64')
url="https://github.com/craftyguy/keyboard_latency"
license=('GPL3')
depends=('glibc')
makedepends=('gcc' 'make')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/craftyguy/keyboard_latency/archive/${pkgver}.tar.gz")
md5sums=('3a89b4fa77353edb2b8c8289d73e257f')
prepare() {
        cd "$pkgname-$pkgver"
}

build() {
        cd "$pkgname-$pkgver"
        make all
}

check() {
        cd "$pkgname-$pkgver"
}

package() {
        cd "$pkgname-$pkgver"
        install -m755 -D "$pkgname" "$pkgdir/usr/bin/$pkgname"
        install -m644 -D "$srcdir/$pkgname-$pkgver/keyboard_latency.service" "${pkgdir}/usr/lib/systemd/system/keyboard_latency.service"
}

