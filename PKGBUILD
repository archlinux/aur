# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=hubic-gtk
pkgver=0.6
pkgrel=1
_fossilver=0f1628c147
pkgdesc="An attempt to get a status icon for Hubic on Linux"
arch=('any')
url="https://projects.depar.is/hubic-gtk/"
license=('custom:WTFPL')
depends=('hubic' 'python2' 'pygtk' 'python2-dbus' 'python2-notify' 'python2-xdg' 'zenity')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::https://projects.depar.is/hubic-gtk/raw/archlinux/$pkgname-$pkgver.tar.gz?name=$_fossilver)
sha1sums=('0f1628c14725e67a9cdefbf5b80040c97376f795')

build(){
  cd $srcdir/$pkgname
  PKGVER=$pkgver make build
}

package() {
  cd $srcdir/$pkgname
  PKGVER=$pkgver make install DEST=$pkgdir/usr
}

# vim:set ts=2 sw=2 et:
