# Maintainer: Mike Simpson <oatbar@mikesimps.aleeas.com>

pkgname='oatbar'
pkgver=0.1.0
pkgrel=1
pkgdesc='Powerful and customizable DE and WM status bar'
arch=('x86_64')
url="https://oatbar.app/"
license=('Apache-2.0')
depends=('pango' 'cairo' 'libxcb' 'pkgconf')
makedepends=('cargo')
provides=('oatbar-desktop' 'oatbar-keyboard' 'oatbar-stats' 'oatctl')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('SKIP')

package() {
  export RUSTUP_TOOLCHAIN=stable
  cargo install --no-track --all-features --locked --root "$pkgdir/usr/" --path ./$pkgname-$pkgver
}
