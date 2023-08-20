# Maintainer: Mordechai Hadad <mordechai.hadad01@gmail.com>
# Maintainer: orhun <orhunparmaksiz@gmail.com>

# https://github.com/orhun/pkgbuilds

pkgname=bob-bin
pkgver=2.5.0
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
sha512sums_x86_64=('df1b62e8ee057b174b79b1ae9567556a7afbdc81b2a78e12c8e991e1d7e0d7fda52cda70401dac88f933dd0d0e792a1c50e7a7066f53b581b2761c4d1f7400e8'
                   '099e559e80e9938156f327a923302b469e01162a7be8281386f1a323e97786fbd7d2718904de012b22396dc788976bce006113d56eaa809fe9b5987cb68c155d'
                   'c1cd584c2cf8d21edaeee3e479139ecf42ea69a0694e3452c3870ba3dca35c480e399f3e85a1e4f3e754c58f69b566aa0bf1c4b4b960c00a34ce4f949c73204f')

package() {
	install -Dm 755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
