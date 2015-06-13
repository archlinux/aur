# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=pdextended-touchosc-git
pkgver=44.443c793
pkgrel=1
pkgdesc="A TouchOSC MIDI bridge for Pd, Pd-Extended version"
arch=("i686" "x86_64")
license=('BSD')
url="https://bitbucket.org/agraef/pd-touchosc/"
depends=('pd-extended' 'pdextended-pure' 'pure-avahi' 'pure-stldict' 'pure-xml')
makedepends=()
source=("git+https://bitbucket.org/agraef/pd-touchosc")
md5sums=(SKIP)

pkgver() {
  cd $srcdir/pd-touchosc
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
     cd $srcdir/pd-touchosc
     make PD=pd-extended
}

package() {
     cd $srcdir/pd-touchosc
     make DESTDIR=$pkgdir PD=pd-extended install
}
