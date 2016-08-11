# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=hubic-gtk
pkgver=0.6.2
pkgrel=1
pkgdesc="An attempt to get a status icon for Hubic on Linux"
arch=('any')
url="https://projects.depar.is/hubic-gtk/"
license=('custom:WTFPL')
depends=('hubic' 'python2' 'pygtk' 'python2-dbus' 'python2-notify' 'python2-xdg' 'zenity')
source=($pkgname-$pkgver.tar.gz::https://projects.depar.is/hubic-gtk/tarball/HubicGTK.tar.gz?uuid=v$pkgver)
sha256sums=('ee1ea9999793238ebefe4e8e26cc5f587ff99aa5eccf9d6a1dd8363e224c8516')

build(){
  cd $srcdir/HubicGTK
  PKGVER=$pkgver make build
}

package() {
  cd $srcdir/HubicGTK
  PKGVER=$pkgver make install DEST=$pkgdir/usr
}

# vim:set ts=2 sw=2 et:
