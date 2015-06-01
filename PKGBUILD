# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
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

pkgname=apache-mod_geoip2
pkgver=1.2.8
pkgrel=1
pkgdesc="geoip interface module for apache."
arch=('i686' 'x86_64')
url="http://www.maxmind.com/app/mod_geoip"
license=('LGPL')
depends=('apache' 'geoip')
makedepends=('apache' 'geoip')
source=("http://geolite.maxmind.com/download/geoip/api/mod_geoip2/mod_geoip2_$pkgver.tar.gz")
md5sums=('adab5ca32be41980155e07c8c8bcfc87')

build() {
  cd $srcdir/mod_geoip2_$pkgver
  apxs -lGeoIP -L/usr/lib -I/usr/include -c mod_geoip.c
}

package() {
  cd $srcdir/mod_geoip2_$pkgver
  install -Dm0755 .libs/mod_geoip.so $pkgdir/usr/lib/httpd/modules/mod_geoip.so
}

# vim:set ts=2 sw=2 et:
