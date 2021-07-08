# Maintainer: Christian Brassat <christian.brassat@gmail.com>

pkgname=pop-wallpapers-git
pkgver=1.0.5.r1.gc7a37b4
pkgrel=1
pkgdesc='Official Pop!_OS Wallpapers'
arch=('any')
url='https://github.com/pop-os/wallpapers'
license=('cc-by-sa' 'public domain')
depends=()
makedepends=('git' 'imagemagick')
source=("git+https://github.com/pop-os/wallpapers.git")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/wallpapers
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/wallpapers
  make -j
}

package() {
  cd $srcdir/wallpapers
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
