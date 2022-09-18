# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cargo-binstall-bin
pkgver=0.13.1
pkgrel=1
pkgdesc="Binary installation for Rust projects"
arch=('x86_64')
url="https://github.com/cargo-bins/cargo-binstall"
license=('GPL3')
depends=('gcc-libs')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tgz::$url/releases/download/v$pkgver/${pkgname%-bin}-x86_64-unknown-linux-gnu.tgz"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('bc67a67e324eeca7a59fc44950996aaa9aeee56b124855ff7a4d67347a27272870b45a0d5108c80a3532f43a073c10ebf7775fdac2cec1f9f49597a0ae2d205e'
                   'faf60e8618e280534c1b91bb76f8fd5ba71850d0f3fe5705d17785fbb65b5ace1bb4bb9240aa70a60bf8bf2d21d101ff063e9d0a7a1fedc8916422ca47144046')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
