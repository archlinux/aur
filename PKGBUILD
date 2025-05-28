# Maintainer: Debjeet Banerjee <debjeet.banerjee2023@uem.edu.in>
# Co-Maintainer: Imon Chakraborty
pkgname='kaizen-bin'
pkgver='2.0.0'
pkgrel=1
pkgdesc="Terminal-based anime streaming & browsing tool"
arch=('x86_64')
url="https://github.com/serene-brew/kaizen"
license=('MIT')
depends=('mpv' 'curl')
makedepends=('wget')
source=("https://github.com/serene-brew/kaizen/releases/download/v2.0.0/Kaizen_v2.0.0_Linux_x86_64.tar.gz"
  "https://github.com/serene-brew/kaizen/raw/main/README.md")
sha256sums=('672271f3853de8a9115edaae6f6f03e0ff12688d14e0f0bec89515f24cc71bf1'
  'SKIP')

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  tar -xvzf "$srcdir/Kaizen_v2.0.0_Linux_x86_64.tar.gz" -C "$srcdir/"
  install -Dm755 "$srcdir/kaizen" "$pkgdir/usr/bin/kaizen"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/doc/$pkgname/LICENSE"
}
