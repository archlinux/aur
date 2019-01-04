pkgname=buddhasay
pkgver=0.4.0
pkgrel=1
pkgdesc="Like Cowsay, but with a Buddha."
url="https://github.com/luisonthekeyboard/buddhasay"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('APACHE')
source=("https://github.com/luisonthekeyboard/buddhasay/archive/$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd $srcdir/buddhasay-$pkgver
  cargo build --release
}

package() {
  cd $srcdir/buddhasay-$pkgver
  install -Dm755 target/release/buddhasay "$pkgdir/usr/bin/buddhasay"
  install -d "$pkgdir/usr/share/buddhasay"
  install -Dm755 resources/buddhasay.toml "$pkgdir/usr/share/buddhasay/buddhasay.toml"
}
