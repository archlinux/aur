# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=onefetch-bin
pkgver=2.9.0
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
               "$pkgname-$pkgver-man.1::$url/raw/master/docs/${pkgname%-bin}.1")
sha512sums_x86_64=('75c5884eaa65b250723f1842cc89f085a6983235d362c5cd06e2acb93d755d41c6291b2e93e33b7894567c696ea95458e31062e53a9ab1c591819dab4e42cb82'
                   '57e2b42cf721a6a4e6643ad5084cf5149e2639a9e91ac643e0f55adf77f0af36204ca74857fb0debbb22b34123c86e2ec8020aa41c19d8d7b7463a9f85a0e87d'
                   '0f38070f7dd3fa10d6b22602137ad45201a83536a57a63024f9f66d92c02f80f4e338fd909bd8edc53ec0536072333686a6b9b3dc2c28421aeff08f7d5b547b0'
                   '19d4c7c8f11a0007d8b4aee96acace2021af3fd9276c076e79533e3a449c290347fbe7531f52d953dbfae0a1df707c1ef5b7802e7fd2787a05a0648cbc44fa2f')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm 644 "$pkgname-$pkgver-man.1" "$pkgdir/usr/share/man/man1/${pkgname%-bin}.1"
}
