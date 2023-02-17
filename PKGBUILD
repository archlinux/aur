# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=apekey
pkgver=0.2.1
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
sha256sums=('bac11115d72e02a0b21a1e35555f7536c18b76cfaa811b03dea825a605ac00fa')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dvm 755 "target/release/apekey" "$pkgdir/usr/bin/apekey"
  install -Dvm 644 "apekey.toml" "$pkgdir/usr/share/doc/apekey/config/apekey.toml"
}

