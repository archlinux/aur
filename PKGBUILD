# Maintainer: Attenuation <ouyangjun1999@gmail.com>
pkgname=hegemon
pkgver=20181118.063958
pkgrel=1
pkgdesc='A modular system monitor written in Rust '
arch=('x86_64')
url='https://github.com/p-e-w/hegemon'
license=('GPL-3.0')
makedepends=('rust')
depends=('lm_sensors')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

build() {
  cd "$pkgname"

  cargo build --release
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}
