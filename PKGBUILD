# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cargo-binstall-bin
pkgver=0.11.1
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
sha512sums_x86_64=('80e87e87e8272083cf89b5d70fa21e0d6392f9da594e2e167eeaf31b5b95495979ac2f92493cad07144cf20809865def4a3a378f25873b56a8bb00b5c10f0036'
                   '6fe1bfbf46b40ffd0b07ccdbd2460f9823f08d21ee9f9fdcab8274a2d5724fd590f194292a7829fa3abd8b159b3283c8557922952e78473e177abd75df5386f1')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
