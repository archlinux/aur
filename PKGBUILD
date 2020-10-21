# Maintainer: amesgen <amesgen AT amesgen DOT de>

pkgname=coursier-native
_pkgver=2.0.4
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc="Pure Scala Artifact Fetching (native-image edition)"
arch=("x86_64")
url="http://get-coursier.io"
license=("Apache")
depends=("gcc-libs" "zlib")
source=("coursier-$pkgver::https://github.com/coursier/coursier/releases/download/v$_pkgver/cs-x86_64-pc-linux")
sha256sums=('f5e560555e6df8c8f554ebb958e3b26a26c6f117802c79ccce81e3ec17f43124')

package() {
  install -Dm755 "coursier-$pkgver" "$pkgdir/usr/bin/cs"
  install -Dm644 <("$pkgdir/usr/bin/cs" --completions zsh) "$pkgdir/usr/share/zsh/site-functions/_cs"
}
