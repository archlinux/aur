# Maintainer: Hannes Schulze <projects@guidedlinux.org>
pkgname=archmaker
pkgver=0.0.1
pkgrel=6
pkgdesc="Quickly and easily create your own arch-based GNU/Linux-distribution"
arch=('x86_64')
url="https://archmaker.guidedlinux.org/"
license=('GPL3')
depends=('vte3' 'gtk3' 'gtkmm3' 'archiso')
makedepends=('git')
provides=('archmaker')
conflicts=('archmaker')
source=("$pkgname-$pkgver"::'git+https://github.com/guidedlinux/archmaker#branch=master')
md5sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
