# Maintainer: Phillip Smith <pkgbuild@phs.id.au>
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

pkgname=sgwi
pkgver=1.1.8
pkgrel=1
pkgdesc="A web-interface to the SQLGrey greylister for Postfix."
arch=('any')
url="http://www.vanheusden.com/sgwi/"
license=('GPL')
depends=('sqlgrey')
backup=("srv/http/$pkgname/includes/config.inc.php")
source=("${pkgname}-${pkgver}.tar.gz::https://www.vanheusden.com/sgwi/sqlgreywebinterface-{$pkgver}.tgz")
md5sums=('b7ea3cec4a30033e087530264cd7ea19')

_INST_DIR="srv/http/$pkgname"
_UID=33
_GID=33

package() {
  mkdir -p $pkgdir/$_INST_DIR

  cp -r $srcdir/sqlgreywebinterface-$pkgver/* $pkgdir/$_INST_DIR
  
  chown -R $_UID:$_GID $pkgdir/$_INST_DIR
}

# vim:set ts=2 sw=2 et:
