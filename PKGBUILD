# Maintainer: krant <aleksey.vasilenko@gmail.com>

pkgname=oklch-color-picker
pkgver=2.4.3
pkgrel=1
pkgdesc="A standalone color picker application using the Oklch colorspace (based on Oklab)"
url="https://github.com/eero-lehtinen/oklch-color-picker"
license=('MIT')
arch=('x86_64')
depends=('libglvnd' 'libxkbcommon')
makedepends=('rust')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('816fc806a892f6ef5e7047e2da5c793ac79926347dc6881aac66809e16dc318da63a4b26ba6533034ebd8ad309405b5184abd3c45ceb855f93b487ff9b6719ef')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -vDm755 -t "$pkgdir/usr/bin" target/release/$pkgname
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
