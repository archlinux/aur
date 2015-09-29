# Maintainer: Tim Diels <timdiels.m@gmail.com>

pkgname=python-gup-git
pkgver=version.0.5.1.r3.g54fca4f
pkgrel=1
pkgdesc='A general purpose, recursive, top down software build system'
arch=('any')
url=https://github.com/gfxmonk/gup
license=('LGPL2')
makedepends=(pychecker git)
depends=(python)
source=("git+https://github.com/gfxmonk/gup.git")
md5sums=(SKIP)
conflicts=(python-gup)
provides=(python-gup)

pkgver() {
  cd gup
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd gup
  make python
}

package() {
  cd gup
  mkdir -p ${pkgdir}/usr/bin/
  install -D -m755 python/bin/gup ${pkgdir}/usr/bin/
}

# vim:set ts=2 sw=2 et:
