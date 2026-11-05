# Maintainer: deeadly at Discord

pkgname=tapes-bin
pkgver=0.1.6beta
_tag=v0.1.6-beta
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
sha256sums=('14e4bc48ef2e31d74dbfeeea616d15e3d7c9d646d121a2fd77a7b60ee18e996d'
            '33958a9cac02e9b9796325e4e8ba4c48e28761b51f0044affe4e688aca861f7c'
            '41e1ae4e1b806de1f7cd45929dae9f5096ae842c03c720478b8fb6c909d6c3cb')

package() {
  install -Dm755 "$srcdir/tapes-x86_64-unknown-linux-gnu-$_tag/tapes" "$pkgdir/usr/bin/tapes"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
