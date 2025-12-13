# Maintainer: Alexander Tagirov [aur @tagirov.cc]

pkgname=rusk
pkgver=0.6.1
pkgrel=1
pkgdesc="A minimal cross-platform terminal task manager written in Rust"
arch=("x86_64")
url="https://github.com/tagirov/rusk"
makedepends=("rust")
license=("GPL-3.0-or-later")
depends=('gcc-libs')
source=("rusk-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3cec2e4b532dd8e414c0eea0680b01c6d6fde6dcbc0b7d5d95d88b1c05617fe4')
options=('!debug')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/rusk "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"


 # Show completions installation instructions
msg ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
msg ""
msg "To enable <TAB> completions for your shell, run one of the following:"
msg ""
msg "  For Bash:        rusk completions install bash"
msg "  For Zsh:         rusk completions install zsh"
msg "  For Fish:        rusk completions install fish"
msg "  For Nu Shell:    rusk completions install nu"
msg "  For PowerShell:  rusk completions install powershell"
msg ""
msg "Batch install: rusk completions install bash zsh fish"
msg ""
msg ""
msg "For extra information, see: /usr/share/doc/rusk/README.md or github.com/tagirov/rusk"
msg "" 
msg ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
}
