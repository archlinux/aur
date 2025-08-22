# Maintainer: Dainis Koknese <gatesby@protonmail.com>

pkgname="tezaurs-tui"
pkgrel="1"
pkgdesc="Browse Latvian thesaurus (tezaurs.lv) in the terminal"
pkgver="f9d8a9e"
arch=("x86_64")
license=("custom")
makedepends=("git" "go")
depends=("fzf")
source=("https://github.com/deimoss123/${pkgname}/tarball/main")
sha256sums=("414f1435356f3729147c42c7ce45e4fbb0bd9b4f5364cc087c29f0eb7fc19b9e")

build() {
  cd deimoss123-tezaurs-tui-f9d8a9e
  go build
}

package() {
  mkdir -p ~/.local/share/tezaurs ~/.local/bin
  mv -v "$srcdir"/deimoss123-tezaurs-tui-${pkgver}/tezaurs ~/.local/bin/
  cp -v "$srcdir"/deimoss123-tezaurs-tui-${pkgver}/wordlist.txt ~/.local/share/tezaurs/

  echo "If the command is not found, add ~/.local/bin to your PATH:"
  echo "  export PATH=\"\$PATH:\$HOME/.local/bin\""
}


