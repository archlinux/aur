# Maintainer: TwoLeaves <ohneherren@gmail.com>
pkgname=sam
pkgver=r44.78f363d
pkgrel=1
pkgdesc="Sam is an adaption to C of the speech software SAM (Software Automatic Mouth) for the Commodore C64."
url="http://simulationcorner.net/index.php?page=sam"
arch=('x86_64' 'i686')
license=('unknown')
makedepends=('git')
source=('SAM::git+http://github.com/s-macke/SAM/#branch=master')
md5sums=('SKIP')

pkgver() {
  cd SAM
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/SAM"
  make
}

package() {
  cd "${srcdir}/SAM"
  install -D -m755 sam "${pkgdir}"/usr/bin/sam
}

# vim:set ts=2 sw=2 et:
