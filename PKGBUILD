# Maintainer: Jonathan Steel <jsteel at archlinux.org>

pkgname=yabar-git
_pkgname=yabar
pkgver=0.1.0.r0.gea4f877
pkgrel=1
pkgdesc="Modern and lightweight status bar for X window managers"
arch=('i686' 'x86_64')
url="https://github.com/geommer/yabar"
license=('unknown')
depends=('pango' 'libconfig')
makedepends=('git')
provides=('yabar')
conflicts=('yabar')
source=(git://github.com/geommer/yabar.git)
md5sums=('SKIP')

pkgver() {
  cd $_pkgname

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $_pkgname

	make
}

package() {
	cd $_pkgname

	make DESTDIR="$pkgdir" install
}
