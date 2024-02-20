# Maintainer: Mordechai Hadad <mordechai.hadad01@gmail.com>
# Maintainer: orhun <orhunparmaksiz@gmail.com>

# https://github.com/orhun/pkgbuilds

pkgname=bob-bin
pkgver=2.8.1
pkgrel=1
pkgdesc="A version manager for neovim"
arch=('x86_64')
url="https://github.com/MordechaiHadad/bob"
license=('MIT')
depends=('gcc-libs')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/MordechaiHadad/bob/releases/download/v${pkgver}/bob-linux-x86_64.zip"
	           "$pkgname-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE"
	           "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('92c80c926969e414be9b702b4687b9978b0a988ae2e6669419c5a9ef94ec9b668cac932ff9be0e4f538b565b25414ccdc55133b807e1df3eb788d39df6dabb54'
                   '88b112def47f8b8e9fe085c362061faf7284860bb88f7666a94e5bb2b63c41ad8b0fb1921f99ba1b1bd3e28b88f4dc585327e88a992f2dc345cb2771784bead3'
                   '5fa693424fb78e8ccc02fda9caf745dbc51b3feb62d4a0e9e38f8a78acfdf0a45fbd36aa50eb1e8d66b64ef6601397aa70408225ea7a997b498ac5206511844c')

package() {
	install -Dm 755 "${pkgname%-bin}-linux-x86_64/${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
