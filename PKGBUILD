# Maintainer: Debjeet Banerjee <debjeet.banerjee2023@uem.edu.in>
pkgname='kaizen-bin'
pkgver='1.1.4'
pkgrel=1
pkgdesc="Terminal-based anime streaming & browsing tool"
arch=('x86_64')
url="https://github.com/serene-brew/kaizen"
license=('MIT')
depends=('mpv' 'curl')
makedepends=('wget')
source=("https://github.com/serene-brew/kaizen/releases/download/v1.1.4/Kaizen_v1.1.4_Linux_x86_64.tar.gz"
  "https://github.com/serene-brew/kaizen/raw/main/README.md")
sha256sums=('633b4e8b7b023627bd58064a16937cdc210c76cc2de5c23e9a2c52f5738fafb6'
  'SKIP')

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  tar -xvzf "$srcdir/Kaizen_v1.1.4_Linux_x86_64.tar.gz" -C "$srcdir/"
  install -Dm755 "$srcdir/kaizen" "$pkgdir/usr/bin/kaizen"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/doc/$pkgname/LICENSE"
}
