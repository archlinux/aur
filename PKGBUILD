# Maintainer: Ensar Sarajčić <es.enar at gmail dot com>
#
pkgname="fbihtax"
pkgver="0.3.0"
pkgrel=1
epoch=
pkgdesc="CLI tool to help manage tax payments in FBiH (Bosnia and Herzegovina Federation) written in Rust."
arch=('any')
url="https://github.com/esensar/fbihtax"
license=('MIT')
groups=()
depends=()
makedepends=('cargo')
checkdepends=()
optdepends=("pdftk: PDF output support")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/esensar/$pkgname/archive/refs/tags/$pkgver.tar.gz")
noextract=()
sha256sums=('f96d45cfe28f769c8b9a92211432e488e96c679f1355001c7d70eaba979bd4e9')
validpgpkeys=()

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release --target-dir target
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm775 "target/release/fbihtax" "$pkgdir/usr/bin/fbihtax"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/fbihtax/LICENSE"
}

# vim:set ts=4 sw=2 ft=sh et syn=sh ft=sh:
