# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cargo-binstall-bin
pkgver=0.9.2
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
sha512sums_x86_64=('93d09d2986cf8bf306e6b7a01885a02bbb3a879b9522076897f56902417a7e3d562f10ec06073b901f88a3fb86fb786e4c16a46a13a01be0ca8550fd460ba44d'
                   '6fe1bfbf46b40ffd0b07ccdbd2460f9823f08d21ee9f9fdcab8274a2d5724fd590f194292a7829fa3abd8b159b3283c8557922952e78473e177abd75df5386f1')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
