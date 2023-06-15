# Maintainer: Mordechai Hadad <mordechai.hadad01@gmail.com>
# Maintainer: orhun <orhunparmaksiz@gmail.com>

# https://github.com/orhun/pkgbuilds

pkgname=bob-bin
pkgver=2.4.0
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
sha512sums_x86_64=('2001fd7277c76b0465960fb5eeb43b3e86b05c34c7702990f2a9f7bd30581fb6cdf255cebfde47aa898a2a251269d476f2cba86facdc5ba2d604e41f8675b88c'
                   '099e559e80e9938156f327a923302b469e01162a7be8281386f1a323e97786fbd7d2718904de012b22396dc788976bce006113d56eaa809fe9b5987cb68c155d'
                   '831169ed12cf2466ae0b435e59cb0d46e428ba99a587f816cea3dcf56ceeb04f60be789fa6d39a450a8b5aaf570c90d8671f12d1c7e61e4dc2728e1180e03447')

package() {
	install -Dm 755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
