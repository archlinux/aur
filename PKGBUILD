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

pkgname=katarina
pkgver=2.0
pkgrel=1
pkgdesc="a perl backup system using rsync as transport"
arch=('any')
url="http://katarina.sourceforge.net/"
license=('GPL2')
depends=('perl' 'rsync')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('0fc4aad047c42342ed7d5d656d9bc2fe')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  sed -e 's|/usr/local/bin/katarina-status|/usr/bin/katarina-status|g' -i *
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  install -Dm0755 katarina.pl "$pkgdir"/usr/bin/katarina
  install -Dm0755 katarina-scheduler.pl "$pkgdir"/usr/bin/katarina-scheduler
  install -Dm0755 katarina-status.pl "$pkgdir"/usr/bin/katarina-status

  install -Dm0755 munin-katarina "$pkgdir"/usr/bin/munin-katarina
  install -Dm0755 munin-katarina-sim "$pkgdir"/usr/bin/munin-katarina-sim
}

# vim:set ts=2 sw=2 et:
