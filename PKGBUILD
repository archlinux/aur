# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Christian Sturm <reezer@reezer.org>
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Contributor: Elias Elwyn <a@jthv.ai>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-plack'
pkgver='1.0057'
pkgrel='1'
pkgdesc="Perl/CPAN Module Plack: Perl Superglue for Web frameworks and Web Servers (PSGI toolkit)"
arch=('any')
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
options=('!emptydirs')
depends=(
	'perl>=5.12.0'
	'perl-apache-logformat-compiler>=0.33'
	'perl-cookie-baker>=0.07'
	'perl-devel-stacktrace>=1.23'
	'perl-devel-stacktrace-ashtml>=0.11'
	'perl-file-sharedir>=1.00'
	'perl-filesys-notify-simple'
	'perl-http-entity-parser>=0.25'
	'perl-http-headers-fast>=0.18'
	'perl-http-message>=5.814'
	'perl-hash-multivalue>=0.05'
	'perl-stream-buffered>=0.02'
	'perl-try-tiny'
	'perl-uri>=1.59'
	'perl-www-form-urlencoded>=0.23')
makedepends=('perl-file-sharedir-install')
checkdepends=(
	'perl-test-requires'
	'perl-test-tcp>=2.15'
	'perl-cgi-compile'
	'perl-cgi-emulate-psgi'
	'perl-fcgi'
	'perl-log-log4perl'
	'perl-mime-types'
	'perl-module-refresh')
url='https://metacpan.org/release/Plack'
source=("http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Plack-$pkgver.tar.gz")
md5sums=('e9962275809ab5ec3891362dc16ebf06')
sha512sums=('5a905f0c2152df3d907d2308507200871577070fa308ee1dd32ece0c62399faf056f7c52d593328090f6b00620f64ec0528759725f1de5c2020eaa3565464b56')
_distdir="Plack-$pkgver"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:

