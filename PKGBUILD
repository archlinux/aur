# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=dh-autoreconf
pkgver=9
pkgrel=2
pkgdesc="debhelper add-on to call autoreconf and clean up after the build"
arch=('any')
url="http://packages.debian.org/sid/dh-make"
license=('GPL')
depends=('debhelper' 'perl' 'autoconf' 'automake' 'gettext' 'libtool')
source=(http://ftp.debian.org/debian/pool/main/d/$pkgname/${pkgname}_$pkgver.tar.gz)
md5sums=('8ee1d5b7f31c36de89ec37c81ae54973')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D "dh_autoreconf" "$pkgdir/usr/bin/dh_autoreconf"
  install -D "dh_autoreconf_clean" "$pkgdir/usr/bin/dh_autoreconf_clean"
  install -D -m 644 autoreconf.pm \
    "$pkgdir/usr/share/perl5/vendor_perl/Debian/Debhelper/Sequence/autoreconf.pm"
}

# vim:set ts=2 sw=2 et:
