# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=gfold-bin
pkgver=0.8.3
pkgrel=1
pkgdesc="CLI tool to help keep track of Git repositories"
arch=('x86_64')
url="https://github.com/nickgerace/gfold"
license=('Apache')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/$pkgver/${pkgname%-bin}-linux-gnu-amd64"
               "$pkgname-$pkgver-README.md::$url/raw/$pkgver/README.md")
sha512sums_x86_64=('4cbdcde5d4f7f0c115cb6d10557b11fea112b4e3d70dc139f6bce10c9a81efffdf4d83eaa68213a0ac2d47e4344418f40f046e08f4613cdd548cd484fb5ac91d'
                   '9c6948e49f95d782cb4fa433f334c329173997bbe9689794f4716b6462ca96b593933d8be94511dafe954a8cfbf88337b916ca8caf4a3276981b61ddf480fd81')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
