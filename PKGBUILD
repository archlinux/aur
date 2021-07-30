# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=tt-bin
pkgver=0.4.2
pkgrel=1
pkgdesc='Terminal based typing test'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/lemnos/tt"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=(
	"$pkgname-$pkgver.1.gz::${url/github/raw.githubusercontent}/v$pkgver/tt.1.gz"
	"$pkgname-$pkgver-LICENSE::${url/github/raw.githubusercontent}/v$pkgver/LICENSE"
)
source_x86_64=("$pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/${pkgname%-bin}-linux")
source_armv7h=("$pkgname-$pkgver-armv7h::$url/releases/download/v$pkgver/${pkgname%-bin}-linux_arm")
source_aarch64=("$pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/${pkgname%-bin}-linux_arm64")

noextract=(
	"tt.1.gz"
)

b2sums=('90b7c16cb63e070efbb910f027b3e9776dc7a0774bfaca7c14206ccb7308cf117b3ad1f96216650aa758bb2e89529d2cb0208ba32003097b82245ca54b9b01b5'
        '2b50a39831de94802d4f09a3f5f28113a856642c10656dfa75f7fe397829051b0e1fa2ae6f499bb3352b9f49932cb016c750ef79acd3895afb6c4955564dd051')
b2sums_x86_64=('69b21a856c0ccedb73ff31a6afc9153d4cffac319df65be3c1cbb15360b69117ecb59aebdb950bfa353d14d929997cb6108d4d797d73cec9fca92c2b885924bd')
b2sums_armv7h=('796f0e70c22be92f39c96e103d075c7ea22a906ed3ba392fdb116e2006896f2191f0e5fa2424584c4f3164a0de64cb19e1f8c2aa6da22ed426d2ca6e7db1f682')
b2sums_aarch64=('8160da4a776b13059da319e7226f29a16fba67a247e228d52a9eb3d0e71ab370bab707511d56ceb70cf90d8dca502f20bc6f336aad77b08b07c522c4c300cc98')

package() {
	install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/${pkgname%-bin}"
	install -Dm644 "$pkgname-$pkgver.1.gz" "$pkgdir/usr/share/man/man1/${pkgname%-bin}.1.gz"
	install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
