# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=passcualito
pkgbin=passc
pkgver=0.1.1
pkgrel=1
pkgdesc="Simple Command-Line Password Manager for Linux"
arch=('x86_64')
url="https://github.com/javiorfo/passcualito"
license=('MIT')
depends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('f789cfcfbce809ac99627ce44bba0d9b7c52c737083ab259e63cbde2a24dfba23d140553a9a4691eedc4493b037d49e0ec123891af2cade4dd77a56eef01c79c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgbin" "$pkgdir/usr/bin/$pkgbin"
}
