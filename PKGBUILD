# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=duperemove-git
pkgver=636.128acd9
pkgrel=2
pkgdesc="Btrfs extent deduplication utility"
arch=('x86_64' 'i686')
url="https://github.com/markfasheh/duperemove"
license=('GPL')
depends=('glib2' 'sqlite')
makedepends=('git')
provides=('duperemove')
source=("${pkgname}"::'git://github.com/markfasheh/duperemove.git#branch=master')
b2sums=('SKIP')

pkgver() {
  cd ${pkgname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd ${pkgname}
  make
}

package() {
  cd ${pkgname}
  make PREFIX=/usr SBINDIR=/usr/bin DESTDIR="${pkgdir}" install
}
