# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-datetimex-easy'
pkgver='0.091'
pkgrel='1'
pkgdesc="Parse a date/time string using the best method available"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime>=0' 'perl-datetime-format-datemanip>=0' 'perl-datetime-format-flexible>=0' 'perl-datetime-format-ical>=0' 'perl-datetime-format-natural>=0' 'perl-datetime-timezone>=0' 'perl-timedate>=0' 'perl-yaml>=0')
makedepends=()
checkdepends=('perl-test-most>=0')
url='https://metacpan.org/release/DateTimeX-Easy'
source=('http://search.cpan.org/CPAN/authors/id/J/JJ/JJNAPIORK/DateTimeX-Easy-0.091.tar.gz')
md5sums=('796a200fed4b58cc2b9de89baf21e1ef')
sha512sums=('568b2a04f9c4066aa848f6852bf352c242f30ac4e29385d2431d020a9fc31b056108f4406cb65142f4ce78c21bcc84bdabdf41bcc464df8634030c90bd534d63')
_distdir="DateTimeX-Easy-0.091"

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
