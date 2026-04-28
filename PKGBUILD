# Maintainer: CreamSodass <greatvaluecreamsoda@gmail.com>

pkgname=ffvship
pkgver=5.0.1
pkgrel=2
pkgdesc="CLI tool for computing the metric difference between two videos"
arch=('x86_64')
url='https://codeberg.org/Line-fr/Vship'
license=('MIT')
depends=('ffms2' 'libvship')
makedepends=('make' 'clang')
sha256sums=('SKIP')
source=("https://codeberg.org/Line-fr/Vship/archive/v${pkgver}.tar.gz")

build() {
  tar -xzf v${pkgver}.tar.gz
  cd "vship"
  make buildFFVSHIP
}

package() {
  cd "vship"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}