# Maintainer: Boohbah <boohbah at gmail.com>

pkgname=trinity-git
pkgver=1.5.r25.gfb4a1ad
pkgrel=1
pkgdesc="A Linux System call fuzz tester (git version)"
arch=('i686' 'x86_64')
url="http://codemonkey.org.uk/projects/trinity/"
license=('GPL')
makedepends=('git')
provides=('trinity')
conflicts=('trinity')
source=('git+https://github.com/kernelslacker/trinity.git')
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname%-git}
  ./configure.sh
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
