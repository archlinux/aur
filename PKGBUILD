# Maintainer: seth <getchoo at tuta dot io>

pkgname=joshuto
pkgver=0.9.2
pkgrel=1
pkgdesc="ranger-like terminal file manager written in Rust"
arch=('x86_64')
url="https://github.com/kamiyaa/joshuto"
license=('LGPL3')
makedepends=('git' 'cargo')
optdepends=(
        'fzf: for better file searching'
        'xclip: for clipboard support on X11'
        'xsel: for clipboard support on X11'
        'wl-clipboard: for clipboard support on Wayland'
)
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/kamiyaa/joshuto/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5d900079c65b644851f6a4cc49e308448a0ad28fa9b4b93ff62460b487c7d839')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --locked --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
