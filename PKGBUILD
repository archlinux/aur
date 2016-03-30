# Maintainer: lorim <lorimz AT gmail DOT com>

pkgname=lib32-libtiff4
pkgver=3.9.5
_pkgrel32=2ubuntu1.9
pkgrel=9
epoch=1
pkgdesc="Library for manipulation of TIFF images (32 bit, legacy version, provides libtiff.so.4)"
arch=('x86_64')
url="http://bbs.archlinux.org/viewtopic.php?id=45393"
license=('custom')
groups=('lib32')
depends=('lib32-zlib' 'lib32-libjpeg-turbo')
source=("http://security.ubuntu.com/ubuntu/pool/main/t/tiff/libtiff4_${pkgver}-${_pkgrel32}_i386.deb")
sha256sums=('7ff879d6721dc27deebcda469a26f844f1a0d1f5eeda023142b137d8f823f976')

package() {

  ar p libtiff4_${pkgver}-${_pkgrel32}_i386.deb data.tar.gz | tar xz

  cd usr/lib/i386-linux-gnu
  install -Dm755 libtiff.so.4.3.4  $pkgdir/usr/lib32/libtiff.so.4.3.4
  
  cd $pkgdir/usr/lib32
  ln -s libtiff.so.4.3.4 libtiff.so.4
  
  install -Dm644 $srcdir/usr/share/doc/libtiff4/copyright $pkgdir/usr/share/licenses/${pkgname}/LICENSE

}
