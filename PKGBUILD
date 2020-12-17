# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=onefetch-bin
pkgver=2.8.0
pkgrel=1
pkgdesc="Git repository summary on your terminal"
arch=('x86_64')
url="https://github.com/o2sh/onefetch"
license=('MIT')
depends=('libgit2')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-linux.tar.gz"
               "$pkgname-$pkgver-LICENSE.md::$url/raw/v$pkgver/LICENSE.md"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md"
               "$pkgname-$pkgver-man.1::$url/raw/master/${pkgname%-bin}.1")
sha512sums_x86_64=('7aa7760235c666f079cb416682a37987bbc6f41242d37deba3fccc381970ddd261dc61f21034ce3602f733adf14a1e46c57c57d8b078734b8a322790254e204a'
                   '57e2b42cf721a6a4e6643ad5084cf5149e2639a9e91ac643e0f55adf77f0af36204ca74857fb0debbb22b34123c86e2ec8020aa41c19d8d7b7463a9f85a0e87d'
                   'a8115e20882379be7f2c376a8321506b0b848b7ca03f19bc58d3743e8c10ead953cf762a91906020195651a67e98d2a29730a060d3d8630b2dae5c1032c3a2bb'
                   'b880b140116c13818d09d1605b3f95300ffb401a57c5d14203602585bcf5f1cad254c10cf2382e0ae9c66947c9cc57863f0025138cc181e83dd06959ae936ded')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm 644 "$pkgname-$pkgver-man.1" "$pkgdir/usr/share/man/man1/${pkgname%-bin}.1"
}
