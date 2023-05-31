# Maintainer: Mordechai Hadad <mordechai.hadad01@gmail.com>
# Maintainer: orhun <orhunparmaksiz@gmail.com>

# https://github.com/orhun/pkgbuilds

pkgname=bob-bin
pkgver=2.3.3
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
sha512sums_x86_64=('20da01d3a2ec1dcef493ae25f97e7263ab5ac3907eaa92484dff44e8d37852db077ba909c77a5b032cc95855437030fb60084da955dd96aae75993740d309428'
                   '099e559e80e9938156f327a923302b469e01162a7be8281386f1a323e97786fbd7d2718904de012b22396dc788976bce006113d56eaa809fe9b5987cb68c155d'
                   '33d5ca6ab0333edf1ede69085f8b945db50a84092aa7cdb2356c09b78c8c96ab3f963b0ca5b93274ec02dc44156120af2f71bb7858711a437c54fa450d14089a')

package() {
	install -Dm 755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
