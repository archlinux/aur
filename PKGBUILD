pkgname="ttf-jetbrains-mono-nf"
pkgver="3.4.0"
pkgrel="1"
pkgdesc="JetBrains Mono nerd font"

url="https://github.com/ryanoasis/nerd-fonts"
license=("OFL")

depends=("fontconfig")
makedepends=("unzip")
arch=("any")

source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/JetBrainsMono.zip")

sha256sums=("76f05ff3ace48a464a6ca57977998784ff7bdbb65a6d915d7e401cd3927c493c")

package() {
  # Create target dir
  install -d "$pkgdir/usr/share/fonts/TTF"

  # Install all fonts
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"

  # Install license file
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL"

  # Install README
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Create font cache trigger file
  install -d "$pkgdir/usr/share/fonts"
  echo "Font cache trigger" > "$pkgdir/usr/share/fonts/.$pkgname"
}
