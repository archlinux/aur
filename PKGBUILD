# Maintainer: NeoTheFox <aur at repraptor.33mail.com>

pkgname=swaytreesave
pkgver=0.4.2
pkgrel=1
pkgdesc="swaytreesave is a command-line tool that enables users of the Sway window manager to save and restore their window layouts effortlessly."
url="https://github.com/fabienjuif/swaytreesave.git"
makedepends=('cargo')
provides=('swaytreesave')
conflicts=('swaytreesave')
arch=('i686' 'x86_64')
license=('MIT')
source=("https://github.com/fabienjuif/swaytreesave/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0752ceabd90341362910b0561cb243c3bbd68ea7066bc4f2466d7ed8cdc84264')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --target-dir target
}

package() {
  cd "$pkgname-$pkgver"
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
}
