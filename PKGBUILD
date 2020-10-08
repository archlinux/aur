# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=gfold-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="CLI tool to help keep track of Git repositories"
arch=('x86_64')
url="https://github.com/nickgerace/gfold"
license=('Apache')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
provides=("${pkgname%-bin}")
source_x86_64=("${pkgname%-bin}-$pkgver::$url/releases/download/$pkgver/${pkgname%-bin}-linux-gnu-amd64"
               "${pkgname%-bin}-$pkgver-README.md::$url/raw/$pkgver/README.md")
sha512sums_x86_64=('497286266bdf30a5da71147b46f7866caa0159c86362dcde4d8453984a4039f582fe0691b682ad67775f4998799abdb74b564f19eae59e4f26ef567637005bda'
                   '810f9f04117051404e731017cde9ade50c323bc1200ea5dae4c7a1619f8057f095d20998f69fdc4716135382f5fc8b28972ec1d9642913e18aacbf149c8982b8')

package() {
  install -Dm 755 "${pkgname%-bin}-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "${pkgname%-bin}-$pkgver-README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
}
