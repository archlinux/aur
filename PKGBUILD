# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=pdl2ork-mdnsbrowser-git
pkgver=7.9e37aff
pkgrel=1
pkgdesc="Zeroconf service advertising and discovery for Pd, Pd-L2Ork version"
arch=("i686" "x86_64")
license=('BSD')
url="https://bitbucket.org/agraef/pd-mdnsbrowser/"
depends=('pd-l2ork' 'pdl2ork-pure' 'pure-avahi')
makedepends=()
source=("git+https://bitbucket.org/agraef/pd-mdnsbrowser")
md5sums=(SKIP)

pkgver() {
  cd $srcdir/pd-mdnsbrowser
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
     cd $srcdir/pd-mdnsbrowser
     make PD=pd-l2ork
}

package() {
     cd $srcdir/pd-mdnsbrowser
     make DESTDIR=$pkgdir PD=pd-l2ork install
}
