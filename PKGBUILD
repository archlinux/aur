# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=dh-autoreconf
pkgver=15
pkgrel=1
pkgdesc="debhelper add-on to call autoreconf and clean up after the build"
arch=('any')
url="http://packages.debian.org/sid/dh-autoreconf"
license=('GPL')
depends=('debhelper' 'perl' 'autoconf' 'automake' 'gettext' 'libtool')
source=(http://ftp.debian.org/debian/pool/main/d/$pkgname/${pkgname}_$pkgver.tar.xz)
sha256sums=('7fbccd30c9cc06a0d60784eea26a6b1943bc78f9a2612fa72a3a7c4eea6ac8fb')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D "dh_autoreconf" "$pkgdir/usr/bin/dh_autoreconf"
  install -D "dh_autoreconf_clean" "$pkgdir/usr/bin/dh_autoreconf_clean"
  install -D -m 644 autoreconf.pm \
    "$pkgdir/usr/share/perl5/vendor_perl/Debian/Debhelper/Sequence/autoreconf.pm"
}

# vim:set ts=2 sw=2 et:
