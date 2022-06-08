# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cargo-binstall-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="Binary installation for Rust projects"
arch=('x86_64')
url="https://github.com/ryankurte/cargo-binstall"
license=('GPL3')
depends=('xz')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tgz::$url/releases/download/v$pkgver/${pkgname%-bin}-x86_64-unknown-linux-gnu.tgz"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('f164c3b673507c5933608d4f8292ec4e9a7d4693e19ab7c25df598efa189735d235647f1f173a4108aefe58e5b1aabe250e5902dec4e3b6d8ea409eeb1da194d'
                   'db24ad93b8c1d02c53e913c1cb35e96a22467d8c4d883285eb74b275502932b2e77d7a4b7c0aa9aeb522ca47ff4316d5f4e332785d106ff67aabf77a5dec7115')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
