# Maintainer: Sebastian Ziebarth <mauspacker@posteo.de>
_author=DORMANDO
_perlmod=MogileFS-Client
pkgname=perl-mogilefs-client
pkgver=1.17
pkgrel=1
pkgdesc="Client library for the MogileFS distributed file system"
arch=(any)
_dist="MogileFS-Client"
url="http://www.mogilefs.org/"
license=('GPL' 'PerlArtistic')
depends=(perl-libwww perl-io-stringy)
options=('!emptydirs')
source=(http://cpan.perl.org/modules/by-authors/id/$_author/$_perlmod-$pkgver.tar.gz)
md5sums=('f077c567fc29358ea6308f22a6ad76e5')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
