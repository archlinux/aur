# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=gfold-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="CLI tool to help keep track of Git repositories"
arch=('x86_64')
url="https://github.com/nickgerace/gfold"
license=('Apache')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/$pkgver/${pkgname%-bin}-linux-gnu-amd64"
               "$pkgname-$pkgver-README.md::$url/raw/$pkgver/README.md")
sha512sums_x86_64=('eb7fa0c2a06d7d78e36586e1191626656ebca46ce7135060d0269f54a42fab3533e396955d6877084625782aa4c920aa2464c3819c0738329bf1a6967c0ccfd0'
                   'be6e6ae68aec58494344e4f7554ef2bbe80735066f8e43d0d1de570df88b5f13cdcbc0a285687f81648974424bb041157866e4009f80023ba2f089d2aa5edf04')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
