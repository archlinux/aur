# Maintainer: Eric Toombs <ewtoombsatuwaterloodotca>
pkgname='lighttpd-debian-scripts'
epoch=1
pkgver=1.4.35.4
pkgrel=1
pkgdesc='The extra scripts contained in the Debian release of lighttpd. Includes create-mime.assign.pl, include-conf-enabled.pl, and use-ipv6.pl.'
url="http://anonscm.debian.org/cgit/pkg-lighttpd/lighttpd.git"
arch=('x86_64' 'i686')
license=('custom')
depends=('lighttpd' 'perl')
source=('git://anonscm.debian.org/pkg-lighttpd/lighttpd.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/lighttpd"
  git describe --tags --abbrev=12 | sed -e 's;debian/;;' -e 's/-/./g'
}

package() {
  cd "$srcdir/lighttpd/debian"
  _dest=
  install -Dm755 "create-mime.assign.pl" \
    "include-conf-enabled.pl" \
    "use-ipv6.pl" \
    -t "$pkgdir/usr/share/lighttpd"
}

# vi:ts=2 sw=2 et
