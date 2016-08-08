# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=hubic-gtk
pkgver=0.6.1
pkgrel=1
pkgdesc="An attempt to get a status icon for Hubic on Linux"
arch=('any')
url="https://projects.depar.is/hubic-gtk/"
license=('custom:WTFPL')
depends=('hubic' 'python2' 'pygtk' 'python2-dbus' 'python2-notify' 'python2-xdg' 'zenity')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::https://projects.depar.is/hubic-gtk/tarball/HubicGTK.tar.gz?uuid=v$pkgver)
sha256sums=('dfe1b45ea4b19ce8593ddd01959f212525a7e84d66c9d88145abd695bc5fe65b')

build(){
  cd $srcdir/HubicGTK
  PKGVER=$pkgver make build
}

package() {
  cd $srcdir/HubicGTK
  PKGVER=$pkgver make install DEST=$pkgdir/usr
}

# vim:set ts=2 sw=2 et:
