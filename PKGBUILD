# Maintainer: Guoyi ("malcology") <guoyizhang@malacology.net>

pkgname=mptp
pkgver=0.2.4
pkgrel=0
pkgdesc="A tool for single-locus species delimitation https://doi.org/10.1093/bioinformatics/btx025"
url='https://github.com/Pas-Kapli/mptp'
arch=('x86_64')
depends=('gsl')
makedepends=('bison' 'git' 'make' 'autoconf' 'make' 'flex')
license=('AGPL')
source=("git+$url#tag=v${pkgver}")
sha256sums=('SKIP')
build(){
  cd ${srcdir}/$pkgname
  ./autogen.sh
  ./configure --prefix=$pkgdir/usr
  make
}

package() {
  cd ${srcdir}/$pkgname
  make install
}
