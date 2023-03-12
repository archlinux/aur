# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=apekey
pkgver=0.2.2
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
sha256sums=('0076e6fdf77e71168659919b2a4add6c7445614067f25899da9d03626ef4c16a')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dvm 755 "target/release/apekey" "$pkgdir/usr/bin/apekey"
  install -Dvm 644 "apekey.toml" "$pkgdir/usr/share/doc/apekey/config/apekey.toml"
}

