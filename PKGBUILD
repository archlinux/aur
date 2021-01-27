# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=gfold-bin
pkgver=0.8.4
pkgrel=1
pkgdesc="CLI tool to help keep track of Git repositories"
arch=('x86_64')
url="https://github.com/nickgerace/gfold"
license=('Apache')
depends=('zlib' 'gcc-libs' 'openssl')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/$pkgver/${pkgname%-bin}-linux-gnu-amd64"
               "$pkgname-$pkgver-README.md::$url/raw/$pkgver/README.md")
sha512sums_x86_64=('2c8c3abf40657719d91add3fe5fc29f0e91652ac8018e70cbb5dc6ae9d7dfba6eb931f3b0149914ed9c35980c875b6e4fb4c6c7380e0151ca73b6e5679fe724a'
                   'ba5e5bf20bb50820ad2d7ee5bd424957ab08fe49f92cf13fcdefa9d3492831897079460d479f21ef12a7f253ea9c007449e2cf1da4a473f1b22dfbc136f3cb36')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
