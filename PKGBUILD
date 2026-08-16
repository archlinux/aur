# Maintainer: hyperpuncher

pkgname=rift-clipboard-bin
pkgver=0.3.0
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
sha256sums_x86_64=('9938e533e72a3181e24e2d0cacb17c7a6cebc1101d4528081f460e7148e4b7bd')
sha256sums_aarch64=('4284a66fa2acf8fa9ce3f51128e048751c87d8e4f177988f7aca602b16e28683')

package() {
	install -Dm755 rift "$pkgdir/usr/bin/rift"
	install -Dm644 rift.service "$pkgdir/usr/lib/systemd/user/rift.service"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
