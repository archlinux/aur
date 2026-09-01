# Maintainer: MrZ_26 <1046101471@qq.com>

pkgname=luatos-cli-bin
pkgver=1.11.0
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
  'd3e675de6e44122a78edf21bdb67828cade8c515f3c7353472222fdfd0c39840'
  '974f32d6c076b5697134adc6075c9614f7d283c1a8676982519082d7a6fe45cf'
)

package() {
  install -Dm755 "$srcdir/luatos-cli" "$pkgdir/usr/bin/luatos-cli"
  install -Dm644 "$srcdir/$pkgname-$pkgver.LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
