# Maintainer: mafuzyk <mafuzyk@gmail.com>
# Prebuilt release binary. Regenerate .SRCINFO after editing:
#   makepkg --printsrcinfo > .SRCINFO

pkgname=sharky-shell-bin
pkgver=0.1.2
_tag=0.1.2
pkgrel=1
epoch=1
pkgdesc="Unix-first interactive shell written in Rust (prebuilt binary, alpha)"
arch=('x86_64')
url="https://github.com/mafuzyk/sharky-shell"
license=('GPL-3.0-only')
provides=('sharky' 'sharky-shell')
conflicts=('sharky' 'sharky-shell' 'sharky-shell-git')
options=(!strip)
source=(
  "$pkgname-$_tag-x86_64.tar.gz::$url/releases/download/v$_tag/sharky-x86_64-unknown-linux-musl.tar.gz"
  "LICENSE-$_tag::$url/raw/v$_tag/LICENSE"
)
sha256sums=(
  'e980f852fe4378f3e2abe1b3055e8d9bdc65d8edae6f13bce9ddf2edc1ca2deb'
  '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
)

package() {
  cd "$srcdir"
  install -Dm755 sharky "$pkgdir/usr/bin/sharky"
  install -Dm644 sharky.1 "$pkgdir/usr/share/man/man1/sharky.1"
  gzip -n "$pkgdir/usr/share/man/man1/sharky.1"
  install -Dm644 config.sharky "$pkgdir/usr/share/sharky/config.sharky"
  install -Dm644 theme.sharky "$pkgdir/usr/share/sharky/theme.sharky"
  install -Dm644 "LICENSE-$_tag" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
