# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs-bin
_pkgname=dotter
pkgver=0.12.15
pkgrel=1
pkgdesc="A dotfile manager and templater written in Rust"
arch=('x86_64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
conflicts=("$_pkgname" "${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('aabfee0de69eaf5b528ed1280e807ebf2cf32ae0afc6919c8eb1510a153e7d96f5c829ca3259a42b8e6cb3f917dc259f98eb77dfd99e3bd7522a210657cde191'
                   'e418e8b208dcf1c0392b46be20f1c1a1bf775befa9f2551c3fc953af0fae93c10f02465a803d41dff3592a266a0575fa67631c3f967721b6e1730a9408772607')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/$_pkgname"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
