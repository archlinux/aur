# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=vdr-checkts
pkgver=0.1
_gitver=0e7880576c0dcf84eaa53cd9c73bc2b5bf1e8d01
pkgrel=1
pkgdesc="Tool to check VDR recordings for errors"
url="http://projects.vdr-developer.org/git/vdr-checkts.git/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('BSD')
depends=('gcc-libs' 'glibc')
makedepends=('git')
source=("git://projects.vdr-developer.org/vdr-checkts.git#commit=$_gitver")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags | sed 's/-/_/g;s/v//'
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 vdr-checkts "$pkgdir/usr/bin/vdr-checkts"
  install -Dm644 COPYRIGHT   "$pkgdir/usr/share/licenses/${pkgname}/COPYRIGHT"
}
