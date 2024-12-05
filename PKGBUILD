# Maintainer: Raiku <rikunn.rikunn@proton.me>
pkgname=wl-neco
pkgver=1.1
pkgrel=1
url="https://github.com/gitRaiku/neco"
pkgdesc="A wayland bouncing neco"
arch=(any)
license=('GPL-3.0')
depends=('wayland' 'wlroots')
makedepends=('make' 'wayland-protocols')
source=("https://github.com/gitRaiku/neco/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('86ce6cea8177bd0d2d4fd698f7838f5a37cc10133cf9a6b72709a619011a7b25')

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
