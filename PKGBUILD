# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=rstatusbar
pkgver=0.4.1
pkgrel=1
pkgdesc="Configurable statusbar for Xorg server using xsetroot. Made in Rust with toml file configuation."
arch=('x86_64')
url="https://github.com/javiorfo/rstatusbar"
license=('MIT')
depends=('rust' 'cargo' 'xorg-xsetroot')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('cc9366d25d8adf1a6eaa3e42695fc234eec072adc53ec76cefd3d686c8633ffc12bf92727c02b251c285abb82f2fa19b17f5f5b967783a09b3d51ffac6f90a6d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
