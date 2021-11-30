# Maintainer: amesgen <amesgen AT amesgen DOT de>

pkgname=coursier-native
_pkgver=2.1.0-M1
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc="Pure Scala Artifact Fetching (native-image edition)"
arch=("x86_64")
url="http://get-coursier.io"
license=("Apache")
depends=("gcc-libs" "zlib")
source=("coursier-$pkgver.gz::https://github.com/coursier/coursier/releases/download/v$_pkgver/cs-x86_64-pc-linux.gz")
sha256sums=('9c0b66c44cfc3226e38b9dfda0d7c97a18873dc96c831ba635b24f4bdce0face')

package() {
  install -Dm755 "coursier-$pkgver" "$pkgdir/usr/bin/cs"
  install -Dm644 <("$pkgdir/usr/bin/cs" --completions zsh) "$pkgdir/usr/share/zsh/site-functions/_cs"
}
