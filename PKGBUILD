# Maintainer: hyperpuncher

pkgname=rift-clipboard-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Lightweight multi-format clipboard manager for Wayland'
arch=('x86_64' 'aarch64')
url='https://github.com/hyperpuncher/rift'
license=('MIT')
depends=('glibc' 'libgcc')
install=rift.install
provides=('rift')
conflicts=('rift' 'rift-bin')
source_x86_64=("$pkgname-$pkgver-linux-x64.tar.gz::$url/releases/download/v$pkgver/rift-linux-x64.tar.gz")
source_aarch64=("$pkgname-$pkgver-linux-arm64.tar.gz::$url/releases/download/v$pkgver/rift-linux-arm64.tar.gz")
sha256sums_x86_64=('668bea96279bec933ea787c1418b1856804aca1ab320f543576b47d481a28ed8')
sha256sums_aarch64=('1830a5d81ee644c55166b107451530daaebcdbe0a8a42d2ee0755dec2d6b6efd')

package() {
	install -Dm755 rift "$pkgdir/usr/bin/rift"
	install -Dm644 rift.service "$pkgdir/usr/lib/systemd/user/rift.service"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
