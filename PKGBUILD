# Maintainer: deeadly at Discord

pkgname=tapes-bin
pkgver=0.1.10beta
_tag=v0.1.10-beta
pkgrel=1
pkgdesc='Atomic dotfiles switcher for Linux and ricing (prebuilt binary)'
arch=('x86_64')
url="https://github.com/futurekismo-oss/tapes"
license=('MIT')
depends=('gcc-libs')
provides=('tapes')
conflicts=('tapes' 'tapes-git')
options=('!debug' '!strip')
source=(
  "$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/$_tag/tapes-x86_64-unknown-linux-gnu-$_tag.tgz"
  "LICENSE::$url/raw/$_tag/LICENSE"
  "README.md::$url/raw/$_tag/README.md"
)
sha256sums=('98bfb866102d425fa85e80e69097c2cce241a1e8a86ce7c42e4f8ef781355359'
            '04154dcce2885d2508d938917eb3f4c3b506ddc8715e3c500bc8b0a78f54922a'
            '33e39668e0c6b0e2df2399094cedf222e1dfde1ce8b83bc7c2365aae98b6e4f5')

package() {
  install -Dm755 "$srcdir/tapes-x86_64-unknown-linux-gnu-$_tag/tapes" "$pkgdir/usr/bin/tapes"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
