# Maintainer: Nigel Michki <nigeil@yahoo.com>
pkgname=segemehl
pkgver=v0.2
pkgrel=1
pkgdesc="A sequence aligner based on short read mapping with gaps"
arch=('i686' 
      'x86_64')
url="http://www.bioinf.uni-leipzig.de/Software/segemehl/"
license=('Unknown')
groups=()
conflicts=()
depends=()
makedepends=('wget'
             'gcc')
optdepends=()
source=('http://www.bioinf.uni-leipzig.de/Software/segemehl/segemehl_0_2_0.tar.gz')
md5sums=('fef4db00ed2742a2bf4131eed674bb08')

prepare() {
  msg2 "Downloading files"
  wget http://www.bioinf.uni-leipzig.de/Software/segemehl/segemehl_0_2_0.tar.gz
  msg2 "Decompressing files"
  tar -xzvf $srcdir/segemehl_0_2_0.tar.gz
}

build() {
  cd $srcdir/segemehl_0_2_0/segemehl
  make
}

package() {
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/bin
  cp $srcdir/segemehl_0_2_0/segemehl/segemehl.x $pkgdir/usr/bin/segemehl.x
  cp $srcdir/segemehl_0_2_0/segemehl/lack.x $pkgdir/usr/bin/lack.x
}
