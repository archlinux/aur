# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-chart-ofc'
pkgver='0.11'
pkgrel='1'
pkgdesc="Generate data files for use with Open Flash Chart"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-graphics-colornames' 'perl-list-moreutils' 'perl-moose>=0.56' 'perl-moosex-strictconstructor>=0.07')
makedepends=('perl-test-requires')
url='http://search.cpan.org/dist/Chart-OFC'
source=('http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/Chart-OFC-0.11.tar.gz')
md5sums=('255f0d898ba5daeeb5abc1348c7b04ba')
sha512sums=('f1a4ae19e609ea41e080b28932f20dab8c766dfdeae5210650402b440b98dcde149b743ecd3f48f45f49165ff077765bad3621da50b6af34a1a18b75ce777c3a')
_distdir="Chart-OFC-0.11"

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
