# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=apekey
pkgver=0.1.3
pkgrel=1
pkgdesc='list and browse your XMonad keymap'
arch=('x86_64')
url='https://github.com/doums/apekey'
license=('MPL2')
depends=('fontconfig')
makedepends=('rust' 'cargo')
provides=('apekey')
conflicts=('apekey')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9124ad92b0e7a51242915cd5acaab3afa8b186f9289a5822a6a92ec2a9ff91f4')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dvm 755 "target/release/apekey" "$pkgdir/usr/bin/apekey"
  install -Dvm 644 "apekey.toml" "$pkgdir/usr/share/doc/apekey/config/apekey.toml"
}

