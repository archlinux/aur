# Maintainer: Raiku <rikunn.rikunn@proton.me>
pkgname=wl-neco
pkgver=1.1.4
pkgrel=2
url="https://github.com/gitRaiku/neco"
pkgdesc="A wayland bouncing neco"
arch=(any)
license=('GPL-3.0')
depends=('wayland' 'wlroots0.18')
makedepends=('make' 'wayland-protocols')
source=("https://github.com/gitRaiku/neco/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b6d30abe5896c8bdaf0278c5bcb3e8d82f21ecf3c3ce574c803ef29db0f74764')

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
