# Maintainer: Mordechai Hadad <mordechai.hadad01@gmail.com>
# Maintainer: orhun <orhunparmaksiz@gmail.com>

# https://github.com/orhun/pkgbuilds

pkgname=bob-bin
pkgver=2.7.0
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
sha512sums_x86_64=('177dd0a98d51dabbefe691f10128aaf4d49720652fee79eec5a6e74a18f73e38aca9e7d0bfacff6860a753c811192c4b66d7b3b80cb89cce8de2a1ced6dea4bb'
                   '099e559e80e9938156f327a923302b469e01162a7be8281386f1a323e97786fbd7d2718904de012b22396dc788976bce006113d56eaa809fe9b5987cb68c155d'
                   '23b0411879a161184454f8e7a7aba472dfe3a1316aec1bf79f0dad0cb668ff4022f0888cc7e5105c1fb0b0ed835682efa08a8c39fae1f10a529f689a8d256554')

package() {
	install -Dm 755 "${pkgname%-bin}-linux-x86_64/${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
