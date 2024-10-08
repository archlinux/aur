# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=batata
pkgver=0.1.0
pkgrel=1
pkgdesc="An opinionated tiled stackable terminal emulator"
arch=("x86_64")
url="https://github.com/hugopl/batata"
license=("MIT")
depends=("gc" "libevent" "pcre2" "gtk4>=1:4.16.2" "libadwaita>=1:1.6.0" "vte4>=0.78.0")
makedepends=("make" "git" "crystal>=1.13.3" "shards>=0.18.0" "libyaml")
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/batata/archive/v${pkgver}.tar.gz")
sha256sums=('ecc8d7570dfbff94bbbc9d331262ac1609ca6cc0a7bd42d8086f00bfeab731f9')

build() {
  cd batata-$pkgver
  make
}

package() {
  cd batata-$pkgver
  make install DESTDIR="${pkgdir}"
}
