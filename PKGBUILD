# Maintainer:  Michael Kogan <michael dot kogan at gmx dot net>

pkgname=perl-net-dbus-glib
pkgver=0.33.0
pkgrel=6
pkgdesc="Net::DBus::GLib - Perl extension for the DBus GLib bindings"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~danberr/Net-DBus-GLib-$pkgver/lib/Net/DBus/GLib.pm"
license=('GPL' 'PerlArtistic')
depends=('dbus-glib' 'glib-perl' 'perl-net-dbus')
source=(http://search.cpan.org/CPAN/authors/id/D/DA/DANBERR/Net-DBus-GLib-$pkgver.tar.gz)
md5sums=('d86fac8abef6781e7f652b1062f474ff')
sha1sums=('42e243e09f7406da276c73d91579bf4a3df3fc78')
options=('!emptydirs')

build() {
    cd "$srcdir/Net-DBus-GLib-$pkgver"
    perl Makefile.PL INSTALLDIRS=vendor
    make || return 1
}
package() {
    cd "$srcdir/Net-DBus-GLib-$pkgver"
    make DESTDIR=$pkgdir install || return 1
}
