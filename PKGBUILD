# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=tcptraceroute
pkgver=1.5beta7
pkgrel=8
pkgdesc="A traceroute implementation using TCP packets."
arch=(i686 x86_64)
url="http://michael.toren.net/code/tcptraceroute/"
license=('GPL')
depends=('libpcap>=1.0.0' 'libnet')
source=("https://github.com/mct/tcptraceroute/archive/${pkgname}-${pkgver}.tar.gz")
md5sums=('8a679c57d5bd702ca91662fd88e964b6')

build() {
   cd "$srcdir"/$pkgname-$pkgname-$pkgver

   ./configure \
     --prefix=/usr \
     --sysconfdir=/etc

   make
}

package() {
   cd "$srcdir"/$pkgname-$pkgname-$pkgver

   make DESTDIR="$pkgdir" install

   install -d -m755 "$pkgdir"/usr/share
   mv "$pkgdir"/usr/man "$pkgdir"/usr/share/
}

# vim:set ts=2 sw=2 et:
