# Maintainer: Max von Forell <aur at vonforell dot de>

pkgname=brim
pkgver=0.1.0
pkgrel=1
pkgdesc='Grab screenshots of all outputs and then blur and save them as JPGs'
arch=(x86_64)
url="https://git.sr.ht/~mvforell/$pkgname"
license=('MIT')
makedepends=('cargo')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('c432c8713411d9edccb7f2c826b6aed34f243176a24a5b6997342ee8f2e664b9')

build() {
  cd $pkgname-$pkgver
  cargo build --release --target-dir 'target/'
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

