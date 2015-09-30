# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-data-section'
pkgver='0.200006'
pkgrel='1'
pkgdesc="read multiple hunks of data out of your DATA section"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mro-compat>=0.09' 'perl-sub-exporter>=0.979')
makedepends=()
checkdepends=('perl-test-failwarnings>=0')
url='https://metacpan.org/release/Data-Section'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Data-Section-0.200006.tar.gz')
md5sums=('7ba2d5e35e54eb46e66f7706e9fa620a')
sha512sums=('8e5cc644bbee6bccde66fbd2e622fb33cb45e0950cc48abd052d0698965f6903b01a3deac251c27106165903219531e33083305233f21651f49541feefdec1b2')
_distdir="Data-Section-0.200006"

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

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
