pkgname=buddhasay
pkgver=0.2.0
pkgrel=1
pkgdesc="Like Cowsay, but with a Buddha."
url="https://github.com/luisonthekeyboard/buddhasay"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('APACHE')
source=("buddhasay_sources::git+https://github.com/luisonthekeyboard/buddhasay.git?tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd buddhasay_sources
  cargo build --release
}

package() {
  cd buddhasay_sources
  install -Dm755 target/release/buddhasay "$pkgdir/usr/bin/buddhasay"
}
