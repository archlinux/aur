# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=sic-image-cli-bin
_pkgname=sic
pkgver=0.15.0
pkgrel=1
pkgdesc="Accessible image processing and conversion from the terminal"
arch=('x86_64')
url="https://github.com/foresterre/sic"
license=('MIT')
conflicts=("$_pkgname" "${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.zip"
               "$pkgname-$pkgver-LICENSE-MIT::$url/raw/v$pkgver/LICENSE-MIT"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md"
               "$url/releases/download/v$pkgver/shell_completions.zip")
sha512sums_x86_64=('894a70f6b2af4e88459901cf6938262cc3cd4fad1de8a3df76d3b14013d5b56b6c6f991b4392adaf762a87b654b0953be908d1cc84b0be8dd4d645c7934d6b89'
                   '011be214fb603bf19617e10c0a9006312aabac26c4148c0a544c0eb01a21259233da7a4a9512752150988ce5b78d90cb18b3b3eb0116e27b6b80c003b43e5a1d'
                   'c53c4233d887bbe69a29f6eb5141b5678e214aeacd7a9e554324ec752bf48f79051af50892b88c594dffd878b3c4bfa7022544ae55579b02590f2303174e4cad'
                   'c3ce7c681c50a4bba8f29cca4f3269b857bd7f5f64b7b84c411fb41d4ff0ace6c06aae760bdcc81be0a750f271bac2cf80f6fc8376d5f3e293d915e2b37d3ecc')

package() {
  install -Dm 755 "$_pkgname" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm 644 "$_pkgname.bash" "${pkgdir}/usr/share/bash-completion/completions/$_pkgname"
  install -Dm 644 "$_pkgname.fish" -t "${pkgdir}/usr/share/fish/completions"
  install -Dm 644 "_$_pkgname" -t "${pkgdir}/usr/share/zsh/site-functions"
}
