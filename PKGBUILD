# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=gfold-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="CLI tool to help keep track of Git repositories"
arch=('x86_64')
url="https://github.com/nickgerace/gfold"
license=('Apache')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/$pkgver/${pkgname%-bin}-linux-gnu-amd64"
               "$pkgname-$pkgver-README.md::$url/raw/$pkgver/README.md")
sha512sums_x86_64=('4b538273c2a38bd4acb80c667336f9ba1754c4ceb3f94d7b7af1fd60b0ba3cb0d2780496572b12b1cde89267b0be42604175cc05181fa0b48ae5fc55001923a6'
                   '9c6948e49f95d782cb4fa433f334c329173997bbe9689794f4716b6462ca96b593933d8be94511dafe954a8cfbf88337b916ca8caf4a3276981b61ddf480fd81')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
