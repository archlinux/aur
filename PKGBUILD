# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-bson'
pkgver='0.11'
pkgrel='1'
pkgdesc="Pure Perl implementation of MongoDB's BSON serialization"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-math-int64' 'perl-tie-ixhash')
makedepends=('perl-datetime' 'perl-test-deep')
url='http://search.cpan.org/dist/BSON'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MINIMAL/BSON-0.11.tar.gz')
md5sums=('fe20da282bc2ca3fcce8d7d2596ae955')
sha512sums=('197a471a352c902d03ab0ea81d31b2a22f368dd5f6ffbc649e03b1c13e5518a937cb8b0655f8568cc79a66fbf6a398b63616a06067809d6bca891926c272078b')
_distdir="BSON-0.11"

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
