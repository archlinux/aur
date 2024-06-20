# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Christian Sturm <reezer@reezer.org>
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Contributor: Elias Elwyn <a@jthv.ai>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-plack'
pkgver='1.0051'
pkgrel='2'
pkgdesc="Perl/CPAN Module Plack: Perl Superglue for Web frameworks and Web Servers (PSGI toolkit)"
arch=('any')
license=('PerlArtistic' 'GPL')
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
	'perl-module-refresh')
url='https://metacpan.org/release/Plack'
source=("http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Plack-$pkgver.tar.gz")
md5sums=('0b3e573458b37ad69069fc8cb307b6b8')
sha512sums=('be4b03f4b2cc6766be4ad06b1405e4513d475676ce8be7b3fd8bcb48cbfeedb7aef67df14a353f49d6b97ecd769f87b0f0787898148c849949f6936486c7ad5b')
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

