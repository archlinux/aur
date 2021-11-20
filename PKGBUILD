# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=yeetgif-bin
pkgver=1.23.6
pkgrel=1
pkgdesc="GIF effects tool for creating emotes"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/sgreben/yeetgif"
license=('MIT')
optdepends=("gifsicle: 'optimize' command support")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=(
	"LICENSE-$pkgver::$url/raw/$pkgver/LICENSE"
	"README-$pkgver.md::$url/raw/$pkgver/README.md")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/$pkgver/gif_${pkgver}_linux_x86_64.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/$pkgver/gif_${pkgver}_linux_x86_32.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/$pkgver/gif_${pkgver}_linux_arm64.tar.gz")
sha256sums=('ff4d38ad7fbb91656babeb3432f3067e346f7324eaa4561ed074dc699878c535'
            '9d32da4fbc6f0ed6f48a81ee8ac8a9c0162a95162d8f4775f89e3d1f7a7268e1')
sha256sums_x86_64=('0b4e81b3f97199e15ecca5b47e7d3c6cf604a392c7126dd25b319f5c176c03be')
sha256sums_i686=('f69383468bb13145fc99969d20f9a388ec05427a5016418ae52e5fdaa727da0f')
sha256sums_aarch64=('d904986955a5d2c4b84a4443f3d114b7ba949daa569a2617f050ac143c4dedaa')

package() {
	install -D gif -t "$pkgdir/usr/bin/"
	install -Dm 644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
