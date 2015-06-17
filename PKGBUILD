#Maintainer: M0Rf30

pkgname=g4l
pkgver=0.47
pkgrel=1
pkgdesc="Ghost 4 Linux is a hard disk and partition imaging and cloning tool."
arch=('any')
url="http://freecode.com/projects/g4l/"
license=('GPL')
depends=('ddrescue' 'partimage' 'dd_rhelp' 'lzop' 'gzip' 'bzip2' 'ncurses' 'fsarchiver')
source=(
#ftp://fedoragcc.dyndns.org/${pkgname}-v${pkgver}.devel.tar.gz
http://fossies.org/linux/misc/${pkgname}-v${pkgver}.devel.tar.gz)
noextract=(${pkgname}-v${pkgver}.devel.tar.gz)
makedepends=(wget)

package() {
  cd $srcdir
  tar -zxvf ${pkgname}-v${pkgver}.devel.tar.gz -C $srcdir bootcd/rootfs
  tar -zxvf ${pkgname}-v${pkgver}.devel.tar.gz -C $srcdir resources/jetcat
  mkdir -p $pkgdir/usr/bin/
  mv $srcdir/bootcd/rootfs/{*g4l,g4l3*} $pkgdir/usr/bin/
  mkdir -p $pkgdir/mnt/local
  cd resources/jetcat
  make clean
  make all 
  install -c -s -m 755 jetcat-mod $pkgdir/usr/bin
}


md5sums=('7abf0c9077f35c43c4f1f9714cd79e13')
md5sums=('c0061e1dd5252a826cdc1e13b2138f74')
