# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=publishr-gimp
pkgver=0.5.0
pkgrel=2
pkgdesc="Publish to Flickr and Picasaweb from within the GIMP interface"
url="http://code.google.com/p/altcanvas/wiki/GimpPublishr"
license=('GPL')
arch=('any')
depends=('gimp')
source=(http://altcanvas.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('16002d262fffa02ed75b1f27467c9f6e')

package() {
  cd "$srcdir"
  
  _DESTDIR='usr/lib/gimp/2.0/plug-ins/'
  
  install -dm755 "$pkgdir"/$_DESTDIR
  install -m755 "$srcdir"/publishr.py "$pkgdir"/$_DESTDIR
  cp -r "$srcdir"/libpub "$pkgdir"/$_DESTDIR
  chmod -R 755 "$pkgdir"/$_DESTDIR
}

# vim:set ts=2 sw=2 et:
