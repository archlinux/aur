# Maintainer: smrqdt <smrqdt@posteo.de>
pkgname=dhcpdump
pkgver=1.9
pkgrel=1
pkgdesc="Capture and visualization of DHCP packets"
arch=("x86_64")
url="https://github.com/bbonev/dhcpdump"
license=('BSD')
depends=('libpcap.so')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("https://github.com/bbonev/dhcpdump/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz"
        "https://github.com/bbonev/dhcpdump/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz.asc")
sha256sums=('3658ac21cc33e79e72bed070454e49c543017991cb6c37f4253c85e9176869d1'
            'SKIP')
validpgpkeys=("BA60BC20F37E59444D6D25001365720913D2F22D")

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
    install -Dm0755 dhcpdump "$pkgdir/usr/bin/dhcpdump"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 dhcpdump.8 "$pkgdir/usr/share/man/man8/dhcpdump.8"
}
