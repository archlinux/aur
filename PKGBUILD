# Maintainer: NeoTheFox <aur at repraptor.33mail.com>

pkgname=swaytreesave
pkgver=0.4.0
pkgrel=1
pkgdesc="swaytreesave is a command-line tool that enables users of the Sway window manager to save and restore their window layouts effortlessly."
url="https://github.com/fabienjuif/swaytreesave.git"
makedepends=('cargo')
provides=('swaytreesave')
conflicts=('swaytreesave')
arch=('i686' 'x86_64')
license=('MIT')
source=("https://github.com/fabienjuif/swaytreesave/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2b31fcbf97bea73d197a8f233a8cfbd872c5daa1856cbc51b642d9ac57b75f3b')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --target-dir target
}

package() {
  cd "$pkgname-$pkgver"
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
}
