# Maintainer: danyf90 <daniele.formichelli@gmail.com>

pkgname=portolan
pkgver=1.0.1
pkgrel=1
pkgdesc="Portolan internet measurement tool"
arch=('any')
depends=('java-runtime>=6' 'wireless_tools')
license=('custom')
url="http://portolan.iet.unipi.it/"
install=$pkgname.install
source=("http://portolan.iet.unipi.it/wp-content/uploads/2014/11/portolan-$pkgver.tar.gz")
sha512sums=('SKIP')

package() {
  cd $srcdir/$pkgname/linux

  # Remove final wait and set installation directory
  sed -i "s/read.*//" install.sh
  export DESTDIR=$pkgdir

  ./install.sh > /dev/null

  # Remove unused file
  rm -r $pkgdir/etc
  rm $pkgdir/usr/share/$pkgname/uninstall.sh
}
