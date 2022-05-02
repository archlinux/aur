# Maintainer: VitalyR <vitalyankh@gmail.com>
# Prior Maintainer: amesgen <amesgen AT amesgen DOT de>

pkgname=coursier-native
_pkgver=2.1.0-M5
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc="Pure Scala Artifact Fetching (native-image edition)"
arch=("x86_64")
url="http://get-coursier.io"
license=("Apache")
depends=("gcc-libs" "zlib")
source=("coursier-$pkgver.gz::https://github.com/coursier/coursier/releases/download/v$_pkgver/cs-x86_64-pc-linux.gz")
sha256sums=('3a9904baba49af5f8fea96eb9fd31aa6779637eb5b177b500ad6ad16706a0f1b')

package() {
  install -Dm755 "coursier-$pkgver" "$pkgdir/usr/bin/cs"
  install -Dm644 <("$pkgdir/usr/bin/cs" --completions zsh) "$pkgdir/usr/share/zsh/site-functions/_cs"
}
