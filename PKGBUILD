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

pkgname=stenc
pkgver=1.0.7
pkgrel=1
pkgdesc="SCSI Tape Encryption Manager"
arch=('i686' 'x86_64')
license=('GPLv2')
url="http://stenc.sourceforge.net/"
source=("https://github.com/scsitape/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('3783cd4e23076b6330e2645b5114e946')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  # configure
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc
  
  # build
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
