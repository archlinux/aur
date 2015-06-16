# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-plugin-pagecache'
pkgver='0.31'
pkgrel='1'
pkgdesc="Cache the output of entire pages"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime' 'perl-digest-sha1' 'perl-mro-compat>=0.10')
makedepends=('perl-cache-cache>=1.04' 'perl-catalyst-plugin-cache>=0.10')
url='http://search.cpan.org/dist/Catalyst-Plugin-PageCache'
source=('http://search.cpan.org/CPAN/authors/id/T/TI/TIMB/Catalyst-Plugin-PageCache-0.31.tar.gz')
md5sums=('370711313606996a9684a898dc83f449')
sha512sums=('4ff16a62f9cc3ac9d3daa4fa83c6639e6853aa4fad2f0fcedd2b6f8cf6ef2e2f4e27b703171c65a1361a51fa1b965d697f43f8e5f2c31160e96d940aef7d6c76')
_distdir="Catalyst-Plugin-PageCache-0.31"

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
