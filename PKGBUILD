# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=sic-image-cli-bin
_pkgname=sic
pkgver=0.17.0
pkgrel=1
pkgdesc="Accessible image processing and conversion from the terminal"
arch=('x86_64')
url="https://github.com/foresterre/sic"
license=('MIT')
depends=('gcc-libs')
conflicts=("$_pkgname" "${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.zip"
               "$pkgname-$pkgver-LICENSE-MIT::$url/raw/v$pkgver/LICENSE-MIT"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md"
               "$pkgname-$pkgver-shell_completions.zip::$url/releases/download/v$pkgver/shell_completions.zip")
sha512sums_x86_64=('ecf87f21f121b15d3b335508c9eb18f3fdad228ae96d6014b823a0d997accefd324eb7541048e00a599698207d42b7886ed6c3dc642dd9c93c2b23d89eadb24d'
                   '011be214fb603bf19617e10c0a9006312aabac26c4148c0a544c0eb01a21259233da7a4a9512752150988ce5b78d90cb18b3b3eb0116e27b6b80c003b43e5a1d'
                   'da4b574eeb15628aec8baaa96414d2c4dc3e98f0da63ac1cc4e370592fc51b568458ef5b9c9336176dc4598d0bd80697728996bbd1d904caf4252af33335bd00'
                   '6cff107423f1b370104e3b6a8f3938ab99765f6d138874564cc3768d84ab20a240449b907b860911cb5b1627c2f5275bfaf0aadd97c19837229086be6b6afb20')

package() {
  install -Dm 755 "$_pkgname" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm 644 "$_pkgname.bash" "${pkgdir}/usr/share/bash-completion/completions/$_pkgname"
  install -Dm 644 "$_pkgname.fish" -t "${pkgdir}/usr/share/fish/completions"
  install -Dm 644 "_$_pkgname" -t "${pkgdir}/usr/share/zsh/site-functions"
}
