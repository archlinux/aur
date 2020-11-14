# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=gfold-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="CLI tool to help keep track of Git repositories"
arch=('x86_64')
url="https://github.com/nickgerace/gfold"
license=('Apache')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/$pkgver/${pkgname%-bin}-linux-gnu-amd64"
               "$pkgname-$pkgver-README.md::$url/raw/$pkgver/README.md")
sha512sums_x86_64=('f9f3cc454e6ae97dfc5ceace1c4e9f5ba9036de26bb1e84ef36fc8bebf59d436c090f00cfb040bbd4204ddb0585c337e8692bba7c954b83cf83b9488197ee132'
                   '07858acee0ea812aefbb0c181c7d2bf9bce4a9a675b51e802898343db20fda1538a4f3ad32064757e7e5485e154a6622092324dfd08cd264c1feff4920e5429f')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
}
