# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages
# Contributor: Manolis Tzanidakis <manolis@archlinux.org>
# Contributer: Hussam Al-Tayeb <ht990332@gmail.com>

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=pppconfig
pkgver=2.3.21
pkgrel=1
pkgdesc="A text menu based utility for configuring ppp."
arch=('i686' 'x86_64')
license=('GPL2')
url="http://ftp.debian.org/debian/pool/main/p/pppconfig"
depends=('ppp' 'dialog' 'perl')
source=("http://ftp.debian.org/debian/pool/main/p/pppconfig/${pkgname}_${pkgver}.tar.gz")
md5sums=('ad3c74ab14827fa841be72cb4283b0c5')

package() {
  cd "$srcdir"/$pkgname-$pkgver

  install -D -m755 pppconfig "$pkgdir"/usr/bin/pppconfig
  install -D -m755 0dns-up "$pkgdir"/usr/bin/0dns-up
  install -D -m755 0dns-down "$pkgdir"/usr/bin/0dns-down
  install -D -m644 man/pppconfig.8 "$pkgdir"/usr/share/man/man8/pppconfig.8

  install -dm755 "$pkgdir"/etc/ppp/{peers,resolv} "$pkgdir"/etc/chatscripts
}

# vim:set ts=2 sw=2 et:
