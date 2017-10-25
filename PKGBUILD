# Maintainer: Bryan Gilbert <bryan at bryan dot sh>
pkgname=mpwc
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple and flexible Master Password CLI client"
arch=('i686' 'x86_64')
url="https://github.com/gilbertw1/mpwc"
license=('GPL')
depends=('libsodium')
makedepends=('cargo')
source=("https://github.com/gilbertw1/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('2eb3a0a95c598bc01246c24e439477d82b3d77e40a272e8a1706e8dc46d269c7')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/mpwc" "$pkgdir/usr/bin/mpwc"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/mpwc/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/doc/mpwc/LICENSE"
  install -Dm644 "doc/mpwc.1" "$pkgdir/usr/share/man/man1/mpwc.1"
}
