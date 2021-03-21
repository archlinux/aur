# Maintainer: amesgen <amesgen AT amesgen DOT de>

pkgname=coursier-native
_pkgver=2.0.15
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc="Pure Scala Artifact Fetching (native-image edition)"
arch=("x86_64")
url="http://get-coursier.io"
license=("Apache")
depends=("gcc-libs" "zlib")
source=("coursier-$pkgver::https://github.com/coursier/coursier/releases/download/v$_pkgver/cs-x86_64-pc-linux")
sha256sums=('80edc9091ba38c998aea0250e4a8bfa775f41fb8086c7dc81ba231d179be1616')

package() {
  install -Dm755 "coursier-$pkgver" "$pkgdir/usr/bin/cs"
  install -Dm644 <("$pkgdir/usr/bin/cs" --completions zsh) "$pkgdir/usr/share/zsh/site-functions/_cs"
}
