# Maintainer: MrZ_26 <1046101471@qq.com>

pkgname=luatos-cli-bin
pkgver=1.10.0
pkgrel=1
pkgdesc='LuatOS command-line toolkit (pure Rust) for flashing, logging, project management, firmware resources, and building'
arch=('x86_64')
url='https://github.com/wendal/luatos-cli'
license=('MIT')
depends=('libudev.so')
provides=('luatos-cli')
conflicts=('luatos-cli')
options=('!strip' '!debug')

_tag="v$pkgver"
_tarball="luatos-cli-x86_64-unknown-linux-gnu.tar.gz"
source=(
  "$_tarball::https://github.com/wendal/luatos-cli/releases/download/$_tag/$_tarball"
  "$pkgname-$pkgver.LICENSE::https://raw.githubusercontent.com/wendal/luatos-cli/$_tag/LICENSE"
)
sha256sums=(
  'f55434edc2aade24d8d9179f19e08c0e5fc67eb3617f93d02f196eb01665de2d'
  '974f32d6c076b5697134adc6075c9614f7d283c1a8676982519082d7a6fe45cf'
)

package() {
  install -Dm755 "$srcdir/luatos-cli" "$pkgdir/usr/bin/luatos-cli"
  install -Dm644 "$srcdir/$pkgname-$pkgver.LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
