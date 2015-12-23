# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=hubic-gtk
pkgver=0.5.4
pkgrel=1
_fossilver=e3ebc54738
pkgdesc="An attempt to get a status icon for Hubic on Linux"
arch=('any')
url="https://projects.depar.is/hubic-gtk/"
license=('custom:WTFPL')
depends=('hubic' 'python2' 'pygtk' 'python2-dbus' 'python2-notify' 'python2-xdg')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::https://projects.depar.is/hubic-gtk/raw/archlinux/$pkgname-$pkgver.tar.gz?name=$_fossilver)
sha1sums=('e3ebc54738647bc78c79d867f1bb71c25bae130e')

build(){
  cd $srcdir/$pkgname
  PKGVER=$pkgver make build
}

package() {
  cd $srcdir/$pkgname
  PKGVER=$pkgver make install DEST=$pkgdir/usr
}

# vim:set ts=2 sw=2 et:
