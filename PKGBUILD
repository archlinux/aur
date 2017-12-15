# Maintainer: Nigel Michki <nigeil@yahoo.com>
pkgname=star-seq-alignment
pkgver=v2.5.3a
pkgrel=1
pkgdesc="An RNA-seq alignment suite, by Alexander Dobin"
arch=('i686' 
      'x86_64')
url="https://github.com/alexdobin/STAR"
license=('GPLv3')
groups=()
conflicts=()
depends=()
makedepends=('wget'
             'gcc')
optdepends=()
source=('https://github.com/alexdobin/STAR/archive/2.5.3a.tar.gz')
md5sums=('baf8d1b62a50482cfa13acb7652dc391')

prepare() {
  msg2 "Downloading files"
  wget $source
  msg2 "Decompressing files"
  tar -xzvf $srcdir/2.5.3a.tar.gz
}

build() {
  cd $srcdir/STAR-2.5.3a/source
  make STAR
}

package() {
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/bin
  cp $srcdir/STAR-2.5.3a/source/STAR $pkgdir/usr/bin/star-seq-alignment
}
