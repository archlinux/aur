# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs-bin
_pkgname=dotter
pkgver=0.12.2
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
sha512sums_x86_64=('f5ab0ab2d60ac5e07a67f382460f1d224d160f803468dc82fb82adb044846fc0bf657f894a63fc34b5f7618104c7b93679d0bda4d2a7bfbea43bbdadb2fe81ac'
                   'd4763f1a64b7e2908f9cb609d4a1a3136552bf2091b7b8d550b2df19c7ac3d2406297eea3bcac0210f204c0dde0ec2865808829a4e5ee3077c18e47811e65708')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/$_pkgname"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
