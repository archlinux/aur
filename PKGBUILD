# Maintainer: Anthony Anderson <aantony4122@gmail.com>
pkgname=mapcli-git
pkgver=1.0
pkgrel=1
pkgdesc="A command line tool to get srg mappings"
arch=('x86_64')
url="https://github.com/illyohs/mapcli"
license=("BSD2")
depends=(
  'sudo'
  'git'
)
source=("$pkgname::git+https://github.com/illyohs/mapcli")
provides=('mapcli')
md5sums=("SKIP")

build() {
  cd $pkgname
  sh -C compile.sh
}

package() {
  cd $pkgname
  mkdir -p ${pkgdir}/usr/bin
  
  cp "${srcdir}/mapcli-git/mapcli" ${pkgdir}/usr/bin/mapcli
}
