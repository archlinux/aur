# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: erkaN kaplaN <erkan@linux-sevenler.org>

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=jwhois
pkgver=4.0
pkgrel=1
pkgdesc="An Internet Whois client"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/jwhois/"
license=('GPL3')
depends=('gdbm' 'libidn')
source=("ftp://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname.patch")
md5sums=('977d0ba90ee058a7998c94d933fc9546'
         '7ce928db7ca3132bc97cadac6288a94e')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver

  patch -Np0 -i "$srcdir"/${pkgname}.patch
}

build() {
  cd "$srcdir"/$pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc

  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
