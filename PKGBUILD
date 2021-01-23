# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs-bin
_pkgname=dotter
pkgver=0.11.1
pkgrel=1
pkgdesc="A dotfile manager and templater written in Rust"
arch=('x86_64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
conflicts=("$_pkgname" "${pkgname%-bin}")
depends=('gcc-libs' 'openssl')
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('e0c686cf70404fe2dbe224a94fd94bf0d2991f47893532dd3b0f817d9eaa645f1e5bb916807f8be25c75966699ed92f85605e9673f3a8ff59f35897356b3d6d2'
                   'f1dd96d0b7c171f7c078ab6cf34fea27f5de6090700a2f9adc0d77571bda50796be30d6dc296baab93edf1bcdaf1296815fb5c7c11f9503e112428ba4c04f425')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/$_pkgname"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
