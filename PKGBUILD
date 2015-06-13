# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=pdextended-lv2plugin-git
pkgver=14.539522c
pkgrel=1
pkgdesc="LV2 plugin host for Pd, Pd-Extended version"
arch=("i686" "x86_64")
license=('BSD')
url="https://bitbucket.org/agraef/pd-lv2plugin/"
depends=('pd-extended' 'pdextended-pure' 'pure-lilv')
makedepends=()
source=("git+https://bitbucket.org/agraef/pd-lv2plugin")
md5sums=(SKIP)

pkgver() {
  cd $srcdir/pd-lv2plugin
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
     cd $srcdir/pd-lv2plugin
     make PD=pd-extended || return 1
}

package() {
     cd $srcdir/pd-lv2plugin
     make DESTDIR=$pkgdir PD=pd-extended install || return 1
}
