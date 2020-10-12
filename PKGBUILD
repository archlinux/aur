# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=gfold-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="CLI tool to help keep track of Git repositories"
arch=('x86_64')
url="https://github.com/nickgerace/gfold"
license=('Apache')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
provides=("${pkgname%-bin}")
source_x86_64=("${pkgname%-bin}-$pkgver::$url/releases/download/$pkgver/${pkgname%-bin}-linux-gnu-amd64"
               "${pkgname%-bin}-$pkgver-README.md::$url/raw/$pkgver/README.md")
sha512sums_x86_64=('8c22e53701fdc7d6a96483e8309f434c3575ecd1fb9c9fd8d4c72100121bfb7d16beac6dd86ad8defc707296cb3a8f172a1cdd83fccd75ce4126b5d791e74e6b'
                   '92581a0ef7f2b25712fd3b476756bdb6e1b7742bdc62d582124da3b7fa153f381bac03f6e73225440e8df034a9087cca3bbed22a1e3917b5054c856a929a44f9')

package() {
  install -Dm 755 "${pkgname%-bin}-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "${pkgname%-bin}-$pkgver-README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
}
