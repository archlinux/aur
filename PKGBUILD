# Original Maintainer: Dave Murphy <davem@devkitpro.org>
# Maintainer: 46620 <46620osu@gmail.com>

pkgname=('libnx-git')
pkgver=4.4.2.r7.gcb6f366a
pkgrel=1
pkgdesc="Nintendo Switch AArch64-only userland library."
arch=('any')
license=('custom')
url="http://github.com/switchbrew"
makedepends=('devkitA64')
groups=('switch-dev')
conflicts=('libnx')
provides=('libnx')
options=(!strip libtool staticlibs)
source=(
  ${pkgname}::git+https://github.com/switchbrew/libnx
)

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {

  cd ${srcdir}/${pkgname}/nx
  make

}

package() {

  cd ${srcdir}/${pkgname}/nx
  make DESTDIR=$pkgdir install

}

sha256sums=('SKIP')

