# Maintainer: lorim <lorimz AT gmail DOT com>

pkgname=lib32-libtiff4
pkgver=3.9.5
_pkgrel32=2ubuntu1.8
pkgrel=8
epoch=1
pkgdesc="A package that installs libtiff.so.4"
arch=('x86_64')
url="http://bbs.archlinux.org/viewtopic.php?id=45393"
license=('custom')
groups=('lib32')
depends=('lib32-zlib' 'lib32-libjpeg-turbo')
source=(http://security.ubuntu.com/ubuntu/pool/main/t/tiff/libtiff4_${pkgver}-${_pkgrel32}_i386.deb)

package() {

  ar p libtiff4_${pkgver}-${_pkgrel32}_i386.deb data.tar.gz | tar xz

  cd usr/lib/i386-linux-gnu
  install -Dm755 libtiff.so.4.3.4  $pkgdir/usr/lib32/libtiff.so.4.3.4
  
  cd $pkgdir/usr/lib32
  ln -s libtiff.so.4.3.4 libtiff.so.4
  
  install -Dm644 $srcdir/usr/share/doc/libtiff4/copyright $pkgdir/usr/share/licenses/${pkgname}/LICENSE

}

sha256sums=('1959867388974afbc5d14e22c26654949ec578917fbb3ea7cfa1790859080990')
