# Maintainer: kengzzzz <github.ezgew@spk4x.com>

pkgname=tiny-poe2smoother-bin
_pkgname=tiny-poe2smoother
pkgver=0.6.1
pkgrel=1
pkgdesc="Desktop app for reducing selected visual and sound effects in Path of Exile 2"
arch=('x86_64')
url="https://github.com/kengzzzz/tiny-poe2smoother"
license=('MIT')
depends=(
  'dbus'
  'gcc-libs'
  'glibc'
  'libglvnd'
  'libx11'
  'libxcursor'
  'libxi'
  'libxkbcommon'
  'libxkbcommon-x11'
  'libxrender'
  'wayland'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')

source_x86_64=(
  "poe2smoother-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/poe2smoother-linux-x86_64.tar.gz"
  "LICENSE-$pkgver::https://raw.githubusercontent.com/kengzzzz/tiny-poe2smoother/v$pkgver/LICENSE"
)
sha256sums_x86_64=(
  '2808c0744002671848324211ec966ad997f6ca4a03c38c075c1916322f773686'
  '1f88511148f9afc5b1f99d4e21e0f6517011f340c46db5e437b1c5e928e14454'
)

package() {
  install -Dm755 poe2smoother \
    "$pkgdir/usr/bin/poe2smoother"

  install -Dm644 README.txt \
    "$pkgdir/usr/share/doc/$pkgname/README.txt"

  install -Dm644 "LICENSE-$pkgver" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
