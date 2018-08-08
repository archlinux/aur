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

pkgname=pgdbf
pkgver=0.6.2
pkgrel=1
pkgdesc="Convert XBase databases (particularly FoxPro tables) into a format that PostgreSQL can directly import"
arch=('i686' 'x86_64')
license=('GPLv3')
url="https://github.com/kstrauser/pgdbf"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kstrauser/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('9b42918b9129ff39d737f405e17bd07a')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  autoreconf --install

  # configure
  ./configure \
    --prefix=/usr \
    --enable-installdocs

  # build
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
