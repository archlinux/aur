# Maintainer: amesgen <amesgen AT amesgen DOT de>

pkgname=coursier-native
_pkgver=2.0.11
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc="Pure Scala Artifact Fetching (native-image edition)"
arch=("x86_64")
url="http://get-coursier.io"
license=("Apache")
depends=("gcc-libs" "zlib")
source=("coursier-$pkgver::https://github.com/coursier/coursier/releases/download/v$_pkgver/cs-x86_64-pc-linux")
sha256sums=('848fb46f2cb1a22084bf62bc27c7e2857e47d90b9285a325ebdcc8fe72702f1a')

package() {
  install -Dm755 "coursier-$pkgver" "$pkgdir/usr/bin/cs"
  install -Dm644 <("$pkgdir/usr/bin/cs" --completions zsh) "$pkgdir/usr/share/zsh/site-functions/_cs"
}
