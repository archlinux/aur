# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=pdextended-mdnsbrowser-git
pkgver=7.9e37aff
pkgrel=2
pkgdesc="Zeroconf service advertising and discovery for Pd, Pd-Extended version"
arch=("i686" "x86_64")
license=('BSD')
url="https://bitbucket.org/agraef/pd-mdnsbrowser/"
depends=('pd-extended' 'pdextended-pure' 'pure-avahi')
makedepends=()
source=("git+https://bitbucket.org/agraef/pd-mdnsbrowser")
md5sums=(SKIP)

pkgver() {
  cd $srcdir/pd-mdnsbrowser
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
     cd $srcdir/pd-mdnsbrowser
     make prefix=/usr PD=pd-extended PDEXE=pd
}

package() {
     cd $srcdir/pd-mdnsbrowser
     make prefix=/usr DESTDIR=$pkgdir PD=pd-extended PDEXE=pd install
}
