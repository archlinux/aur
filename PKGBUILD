# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs-bin
_pkgname=dotter
pkgver=0.10.5
pkgrel=1
pkgdesc="A dotfile manager and templater written in Rust"
arch=('x86_64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
conflicts=("$_pkgname" "${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('c9fbc2cd39a702244929ea828ad4371d8d7e0c937ea244dd97524a224837eb6a376b8eb325e2fc7192b98cdab8a03c6f6c8bb9513e8bbb6f03dc2b5c941ef9c5'
                   'dd26b31189fe6742e81dead2b8a2bafc3a27655a5e98c875f14484e3bd2ef69c2dbea85e46d9a184c09201086c38a9161b06d0395accb53d00cdb80fc95c3bb6')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/$_pkgname"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
