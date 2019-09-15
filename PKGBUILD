# Maintainer: Husam Bilal <me@husam.dev>

pkgname=clipman
pkgver=0.10.0
pkgrel=1
pkgdesc="A simple clipboard manager for Wayland"
url="https://github.com/yory8/clipman"
depends=("wl-clipboard-git")
makedepends=("go-pie")
provides=("clipman")
license=("GPL3")
arch=("x86_64" "i686")
md5sums=("cdbafd1e3e00d1ddc08efd1fca51daa6")
source=("https://github.com/yory8/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
  cd $pkgname-$pkgver
  go build .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
