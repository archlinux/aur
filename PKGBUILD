# Maintainer:  Mike Swanson <mikeonthecomputer@gmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: <kfgz at interia dot pl>
# Contributor: <damir at archlinux dot org>

pkgname=ms-sys-devel
pkgver=2.8.0
pkgrel=1
pkgdesc='Write Microsoft-compatible boot records (MBR and PBR)'
arch=('x86_64')
url=http://ms-sys.sourceforge.net/
license=('GPL')
conflicts=('ms-sys')
provides=('ms-sys')
source=("https://sourceforge.net/projects/${pkgname%-devel}/files/${pkgname%-devel}-$pkgver.tar.gz")
b2sums=('09ccb455cbf189595d393b04c263c5cbf523b565599b741eff27a4c488e9971a07072dc48da4fc727e9e9ddf0fb2ed3584975038fa4a944ea9454f78eaa2d894')

build() {
  cd ${pkgname%-devel}-$pkgver

  make
}

package() {
  cd ${pkgname%-devel}-$pkgver

  make PREFIX=/usr MANDIR=/usr/share/man DESTDIR="$pkgdir" install
}
