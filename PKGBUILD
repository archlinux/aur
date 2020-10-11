# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=gfold-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="CLI tool to help keep track of Git repositories"
arch=('x86_64')
url="https://github.com/nickgerace/gfold"
license=('Apache')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
provides=("${pkgname%-bin}")
source_x86_64=("${pkgname%-bin}-$pkgver::$url/releases/download/$pkgver/${pkgname%-bin}-linux-gnu-amd64"
               "${pkgname%-bin}-$pkgver-README.md::$url/raw/$pkgver/README.md")
sha512sums_x86_64=('1cbd69a73b853dfa310fb3e3452cc18b1b85ef15194fff6d7b038b1f0f77b7dfee88d6b17879d27aeeb27d0af54ba545ad16d16881206ab1b23305feb04502ed'
                   '0e2a1145934527cf8c12789b5bb063c820dd9040ed1607be012b81fcc4c4a80884d048769666af6ee3a5bad3abcf246a0bed906495b305fdb0b3ccd94a09d6d5')

package() {
  install -Dm 755 "${pkgname%-bin}-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "${pkgname%-bin}-$pkgver-README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
}
