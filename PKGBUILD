# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-datetimex-easy'
pkgver='0.089'
pkgrel='1'
pkgdesc="Parse a date/time string using the best method available"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime' 'perl-datetime-format-flexible' 'perl-datetime-format-ical' 'perl-datetime-format-natural' 'perl-timedate')
makedepends=('perl-test-most')
url='http://search.cpan.org/dist/DateTimeX-Easy'
source=('http://search.cpan.org/CPAN/authors/id/R/RO/ROKR/DateTimeX-Easy-0.089.tar.gz')
md5sums=('6439e6a2c238c091031b0f478c2c3418')
sha512sums=('7f508bd78fc2bd257af55d61c43c26b270729b1d2de9643eb1c025c21bde51537e12a0b260037347b46808dbaf16a5b81f01fd4229bfe0926deae753e62be870')
_distdir="DateTimeX-Easy-0.089"

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
