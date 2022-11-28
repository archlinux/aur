# Maintainer: Zoron <zoronlivingston@gmail.com>

pkgname=wgshadertoy
pkgver=0.1.0
pkgrel=1
pkgdesc="A WGSL playground inspired by Shadertoy"
arch=('any')
url="https://github.com/fralonra/wgshadertoy"
license=('MIT')
makedepends=('rust')
source=("https://github.com/fralonra/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('404a6a17239f1a4fd3747605b6078aba')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin/"
  install -Dm644 extra/linux/WgShadertoy.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 extra/logo/$pkgname.svg -t "$pkgdir/usr/share/pixmaps/"
}
