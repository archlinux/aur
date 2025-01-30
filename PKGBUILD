# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=batata
pkgver=0.2.2
pkgrel=1
pkgdesc="An opinionated tiled stackable terminal emulator"
arch=("x86_64")
url="https://github.com/hugopl/batata"
license=("MIT")
depends=("gc" "libevent" "pcre2" "gtk4>=1:4.16.2" "libadwaita>=1:1.6.0" "vte4>=0.78.0")
makedepends=("make" "git" "crystal>=1.13.3" "shards>=0.18.0" "libyaml")
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/batata/archive/v${pkgver}.tar.gz")
sha256sums=('43285216a42702801d45b38f834de46c09a7b1cc9342b5d4b898def0db10a7d0')

build() {
  cd batata-$pkgver
  make
}

package() {
  cd batata-$pkgver
  make install DESTDIR="${pkgdir}"
}
