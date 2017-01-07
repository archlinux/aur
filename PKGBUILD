# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=purrdata-mdnsbrowser-git
pkgver=8.88d2b0c
pkgrel=1
pkgdesc="Zeroconf service advertising and discovery for Pd, Purr-Data version"
arch=("i686" "x86_64")
license=('BSD')
url="https://bitbucket.org/agraef/pd-mdnsbrowser/"
depends=('purr-data' 'purrdata-pure' 'pure-avahi')
makedepends=()
source=("git+https://bitbucket.org/agraef/pd-mdnsbrowser")
md5sums=(SKIP)

pkgver() {
  cd $srcdir/pd-mdnsbrowser
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
     cd $srcdir/pd-mdnsbrowser
     make PD=purr-data
}

package() {
     cd $srcdir/pd-mdnsbrowser
     make PD=pd-l2ork prefix=/opt/purr-data DESTDIR=$pkgdir install
}
