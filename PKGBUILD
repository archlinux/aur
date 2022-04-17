# Maintainer: Guoyi
pkgname=gffcompare
pkgver=0.12.6
pkgrel=2
pkgdesc="classify, merge, tracking and annotation of GFF files by comparing to a reference annotation GFF"
arch=('x86_64')
url="https://github.com/gpertea/gffcompare"
license=('MIT')
depends=()
makedepends=('make' 'git')
optdepends=()
source=(https://github.com/gpertea/gffcompare/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('4e01344c533987a0a8227bfcca9d180504c1a1392aa343e1f6b0752341e712cf')
prepare(){
  cd $srcdir
  git clone https://github.com/gpertea/gclib.git
}
build(){
  cd $srcdir/gclib
  make
}
build() {
  cd "${pkgname}"-$pkgver
  make release
}

package() {
  cd "${pkgname}"-$pkgver
  install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm 755 trmap $pkgdir/usr/bin/trmap
}
