# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=pdl2ork-lv2plugin-git
pkgver=14.539522c
pkgrel=1
pkgdesc="LV2 plugin host for Pd, Pd-L2Ork version"
arch=("i686" "x86_64")
license=('BSD')
url="https://bitbucket.org/agraef/pd-lv2plugin/"
depends=('pd-l2ork' 'pdl2ork-pure' 'pure-lilv')
makedepends=()
source=("git+https://bitbucket.org/agraef/pd-lv2plugin")
md5sums=(SKIP)

pkgver() {
  cd $srcdir/pd-lv2plugin
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
     cd $srcdir/pd-lv2plugin
     make PD=pd-l2ork || return 1
}

package() {
     cd $srcdir/pd-lv2plugin
     make DESTDIR=$pkgdir PD=pd-l2ork install || return 1
}
