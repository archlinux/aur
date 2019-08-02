# Maintainer: Husam Bilal <me@husam.dev>

pkgname=clipman
pkgver=0.9.0
pkgrel=1
pkgdesc="A simple clipboard manager for Wayland"
url="https://github.com/yory8/clipman"
depends=("wl-clipboard-git")
makedepends=("go-pie")
provides=("clipman")
license=("GPL3")
arch=("x86_64" "i686")
md5sums=("33b35a51aed6e6c12d749d3008fe0175")
source=("https://github.com/yory8/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
  cd $pkgname-$pkgver
  go build .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
