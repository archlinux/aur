# # Maintainer: Debjeet Banerjee <debjeet.banerjee2023@uem.edu.in>
# # Co-Maintainer: Imon Chakraborty
# pkgname='kaizen-bin'
# pkgver='2.1.0'
# pkgrel=1
# pkgdesc="Terminal-based anime streaming & browsing tool"
# arch=('x86_64')
# url="https://github.com/serene-brew/kaizen"
# license=('MIT')
# depends=('mpv' 'curl')
# makedepends=('wget')
# source=("https://github.com/serene-brew/kaizen/releases/download/v2.1.0/Kaizen_v2.1.0_Linux_x86_64.tar.gz"
#   "https://github.com/serene-brew/kaizen/raw/main/README.md")
# sha256sums=('6ae0f08fa9f6c047447f5cb100262a9a07c3bec08eef02d569c7a14c602058dd'
#   'SKIP')
#
# package() {
#   mkdir -p "$pkgdir/usr/bin"
#   mkdir -p "$pkgdir/usr/share/doc/$pkgname"
#   tar -xvzf "$srcdir/Kaizen_v2.1.0_Linux_x86_64.tar.gz" -C "$srcdir/"
#   install -Dm755 "$srcdir/kaizen" "$pkgdir/usr/bin/kaizen"
#   install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
#   install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/doc/$pkgname/LICENSE"
# }
#
# Maintainer: Debjeet Banerjee <debjeet.banerjee2023@uem.edu.in>
# Co-Maintainer: Imon Chakraborty
pkgname='kaizen-bin'
pkgver='2.0.1'
pkgrel=1
pkgdesc="Terminal-based anime streaming & browsing tool"
arch=('x86_64')
url="https://github.com/serene-brew/kaizen"
license=('MIT')
depends=('mpv' 'curl')
makedepends=('wget')
source=(
  "https://github.com/serene-brew/kaizen/releases/download/v${pkgver}/Kaizen_v${pkgver}_Linux_x86_64.tar.gz"
  "https://github.com/serene-brew/kaizen/raw/main/README.md"
  "https://github.com/serene-brew/kaizen/raw/main/VERSION"
)
sha256sums=(
  '974246b56beab26899460be05a09796963efa3cb4cc230710409d8806802bf68'
  'SKIP'
  'SKIP'
)

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  mkdir -p "$pkgdir/usr/share/kaizen"

  tar -xvzf "$srcdir/Kaizen_v${pkgver}_Linux_x86_64.tar.gz" -C "$srcdir/"

  install -Dm755 "$srcdir/kaizen" "$pkgdir/usr/bin/kaizen"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/doc/$pkgname/LICENSE"

  install -Dm644 "$srcdir/VERSION" "$pkgdir/usr/share/kaizen/VERSION"

  if [[ -n "$HOME" ]]; then
    mkdir -p "$HOME/.local/share/kaizen"
    rm -f "$HOME/.local/share/kaizen/VERSION"
    cp "$srcdir/VERSION" "$HOME/.local/share/kaizen/VERSION"
  fi
}
