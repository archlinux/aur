# Maintainer: Zoron <zoronlivingston@gmail.com>

pkgname=wgshadertoy
pkgver=0.3.1
pkgrel=1
pkgdesc="A WGSL playground inspired by Shadertoy"
arch=('any')
url="https://github.com/fralonra/wgshadertoy"
license=('MIT')
makedepends=('rust')
source=("https://github.com/fralonra/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('76f2963f820c0b5dbf7c28c6abc61cdd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname         "$pkgdir/usr/bin/$pkgname"
  install -Dm644 extra/linux/WgShadertoy.desktop "$pkgdir/usr/share/applications/io.github.fralonra.WgShadertoy.desktop"
  install -Dm644 extra/logo/$pkgname.svg         "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.fralonra.WgShadertoy.svg"
}
