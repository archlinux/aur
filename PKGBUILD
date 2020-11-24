# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dog-dns-bin
_pkgname=dog
pkgver=0.1.0
pkgrel=1
pkgdesc="Command-line DNS client like dig"
arch=('x86_64')
url="https://github.com/ogham/dog"
license=('custom:EUPL')
conflicts=("$_pkgname" "${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-gnu.zip"
               "$_pkgname-$pkgver-LICENCE::$url/raw/v$pkgver/LICENCE"
               "$_pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha256sums_x86_64=('6093525fccf5de5b7ed66f920c9b6d2d16221adde8a44589dc3e4c47245039a0'
                   '6fc9e709ccbfe0d77fbffa2427a983282be2eb88e47b1cdb49f21a83b4d1e665'
                   '7d877726a27905a9062981675c3946a05e676ee520b465733789c446a40b196f')

package() {
  install -Dm 755 "bin/$_pkgname" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$_pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm 644 "$_pkgname-$pkgver-LICENCE" "$pkgdir/usr/share/licenses/$_pkgname/LICENCE"
  install -Dm 644 "completions/$_pkgname.bash" "${pkgdir}/usr/share/bash-completion/completions/$_pkgname"
  install -Dm 644 "completions/$_pkgname.fish" -t "${pkgdir}/usr/share/fish/completions"
  install -Dm 644 "completions/$_pkgname.zsh" "${pkgdir}/usr/share/zsh/functions/Completion/Linux/_$_pkgname"
  install -Dm 644 "man/$_pkgname.1" -t "$pkgdir/usr/share/man/man1"
}
