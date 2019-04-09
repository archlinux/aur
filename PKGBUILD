# Maintainer Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>

pkgname=wesnoth-rcx-git
pkgver=0.2.1+34+g2afae74
pkgrel=1
pkgdesc="small desktop application for previewing and recoloring Wesnoth graphics"
arch=('i686' 'x86_64')
url="https://shadowm.ai0867.net/projects/wesnoth-rcx"
license=('LGPL')
depends=('qt5-base')
source=("git+https://github.com/shikadiqueen/morningstar.git")
md5sums=('SKIP')

pkgver() {
  cd morningstar

  git describe | sed s/-/+/g
}

prepare() {
  cd morningstar

  sed -i "s;/usr/local;$pkgdir/usr;" morningstar.pro
  qmake -config release
}

build() {
  cd morningstar

  make
}

package() {
  cd morningstar

  make install
}
