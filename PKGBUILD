# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=pd-lv2plugin-git
pkgver=24.98b7fb6
pkgrel=1
pkgdesc="LV2 plugin host for Pd"
arch=("i686" "x86_64")
license=('BSD')
url="https://bitbucket.org/agraef/pd-lv2plugin/"
depends=('pd' 'pd-pure' 'pure-lilv')
makedepends=()
source=("git+https://bitbucket.org/agraef/pd-lv2plugin")
md5sums=(SKIP)

pkgver() {
  cd $srcdir/pd-lv2plugin
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
     cd $srcdir/pd-lv2plugin
     make prefix=/usr || return 1
}

package() {
     cd $srcdir/pd-lv2plugin
     make DESTDIR=$pkgdir prefix=/usr install || return 1
}
