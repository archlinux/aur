# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=sic-image-cli-bin
_pkgname=sic
pkgver=0.16.1
pkgrel=2
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
sha512sums_x86_64=('36f1521424afafb8957f3b7b22141c19b2e5854d116df50dbd6b95b1fa2bd10a20e887ab16fbf5016589d32bad91b9f8bf5e99d9fb8ceeb5781c18286c6a695f'
                   '011be214fb603bf19617e10c0a9006312aabac26c4148c0a544c0eb01a21259233da7a4a9512752150988ce5b78d90cb18b3b3eb0116e27b6b80c003b43e5a1d'
                   'efb2123b749c188001698d50bc1b46005fd83d7ffbeeac91cdce58fbf2b85c48b37712f6f366dee4aa0e6ce2b6d746fb267341f73cff2ee6990625dd4b0c05b3'
                   '187efe14da60f965649986c3e3ab99e19c45c5ece6d458f5f8337335ea81c099bb385c7b32d7b7024936926a2e2fb49f24770739123a4c5d498612edda9eed1e')

package() {
  install -Dm 755 "$_pkgname" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm 644 "$_pkgname.bash" "${pkgdir}/usr/share/bash-completion/completions/$_pkgname"
  install -Dm 644 "$_pkgname.fish" -t "${pkgdir}/usr/share/fish/completions"
  install -Dm 644 "_$_pkgname" -t "${pkgdir}/usr/share/zsh/site-functions"
}
