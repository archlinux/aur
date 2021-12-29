#Maintainer : Michal Wojdyla < micwoj9292 at gmail dot com >
#Contributor: Brian Bidulock <bidulock@openss7.org>
pkgdesc="SR-71 Blackbird theme pack for XDE"
pkgname=xde-theme-blackbirds
_commit=cdd1bc552200892e36d68fc25f1d3d63dba01e40
pkgver=1.2.5
pkgrel=1
url="http://www.unexicon.com/"
license=('CCPL:by-nc-nd')
arch=('any')
groups=('xde')
depends=('xde-styles')
makedepends=('git')
source=("$pkgname::git+https://github.com/bbidulock/xde-theme-blackbirds.git#commit=$_commit")
md5sums=('SKIP')

# Leaving this for pkgver bumps, not really needed for users hence commenting out.
#pkgver() {
#  cd $pkgname
#  ./autogen.sh
#  ./configure --version|head -1|awk '{print$3}'
#
#}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
