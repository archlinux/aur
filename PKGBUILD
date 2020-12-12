# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs-bin
_pkgname=dotter
pkgver=0.10.6
pkgrel=1
pkgdesc="A dotfile manager and templater written in Rust"
arch=('x86_64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
conflicts=("$_pkgname" "${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('a4606d78c0750c12bea21384f0aa06a27f632157070315d9ee7486e819e1327f8de20a51cd3de06877788ecb9df034bd8deebb56fe5c114a904916b6c69e6fcf'
                   '4d0094c6b267c84c75fc9dc69330f39aa4078fade7a06fd7bc2df36b338f91702a548e3732ba014ff0ad97360fd1bbddcc5f882a35db4fbbff937d01af996427')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/$_pkgname"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
