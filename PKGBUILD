# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cargo-binstall-bin
pkgver=0.8.0
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
sha512sums_x86_64=('381b77d0c4ac101e8ab6792d9ab0cb4bd7e477cc3a7d3abf8c1d02eb2f64a476441a8accc8e053ee3e80387d40b0ed694f6f352626e7c75a3f488c9e5da01319'
                   'c67f6b4e2a6cafb86334a3b08e71c408e511be9201c7f806e84bcf18e0e050f4e86b70101ec985259eaad816f2d3e85f312676fe369d1aafa298e3c837110ce7')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
