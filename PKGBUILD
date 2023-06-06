# Maintainer: Zoron <zoronlivingston@gmail.com>

pkgname=wgshadertoy
pkgver=0.2.0
pkgrel=2
pkgdesc="A WGSL playground inspired by Shadertoy"
arch=('any')
url="https://github.com/fralonra/wgshadertoy"
license=('MIT')
makedepends=('rust')
source=("https://github.com/fralonra/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('1fd10b3b82ca219d2c38b8825ad16bf5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin/"
  install -Dm644 extra/linux/WgShadertoy.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 extra/logo/$pkgname.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
}
