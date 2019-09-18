# Maintainer: Husam Bilal <me@husam.dev>

pkgname=clipman
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple clipboard manager for Wayland"
url="https://github.com/yory8/clipman"
depends=("wl-clipboard-git")
makedepends=("go-pie")
provides=("clipman")
license=("GPL3")
arch=("x86_64" "i686")
md5sums=("63b20dbcdeb9d415a5cefa33ef3691fe")
source=("https://github.com/yory8/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
  cd $pkgname-$pkgver
  go build .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
