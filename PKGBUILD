# Maintainer: Raiku <rikunn.rikunn@proton.me>
pkgname=wl-neco
pkgver=1.1.3
pkgrel=1
url="https://github.com/gitRaiku/neco"
pkgdesc="A wayland bouncing neco"
arch=(any)
license=('GPL-3.0')
depends=('wayland' 'wlroots')
makedepends=('make' 'wayland-protocols')
source=("https://github.com/gitRaiku/neco/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dbe6f0d52e717848bc259b86aa4a4854a9459c02c6f549ef5fc2cac10dd8da37')

build() {
  cd $srcdir/Neco-$pkgver
  make
}

package() {
  cd "Neco-$pkgver"
  install -Dm 0644 neco.gif "$pkgdir/usr/share/wl-neco/neco.gif"
  mv bin/neco bin/wl-neco
  install -Dm 0755 bin/wl-neco -t "$pkgdir/usr/bin"
}
