# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=f2-bin
pkgver=1.6.2
pkgrel=1
pkgdesc="Cross-platform command-line tool for batch renaming files and directories quickly and safely"
arch=(x86_64 i686 aarch64)
url="https://github.com/ayoisaiah/${pkgname%-bin}"
license=('MIT')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_i386.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")

b2sums_x86_64=('90be98c727907be99e6afd292d3162204df9bfc0850b1be681ed28e5bd2d7b796e1ed70575fb05538dec3ada94ce49c3dd89223977c4fa961faa2464003d614f')
b2sums_i686=('2c318c290955381de150eec510a8e6b98744c08ae4c6efc66c4f4db98204a064efb9ea2ce9353def68806ae41e2952478938dd61f359d2ecb2876b215090904a')
b2sums_aarch64=('0b7f5c568ec342c68a165b2e62ea10c0c8dfb341d2de7945d5b7eaec3e3c29ebbda861e239eefeb7cb82421d737f225751902fcbe5aeeebfc81c7b4a55e919ef')

package() {
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
