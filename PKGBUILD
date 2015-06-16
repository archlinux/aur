# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-devel-stacktrace-withlexicals'
pkgver='0.10'
pkgrel='1'
pkgdesc="Devel::StackTrace + PadWalker"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-devel-stacktrace>=1.25' 'perl-padwalker>=1.92')
makedepends=()
url='http://search.cpan.org/dist/Devel-StackTrace-WithLexicals'
source=('http://search.cpan.org/CPAN/authors/id/S/SA/SARTAK/Devel-StackTrace-WithLexicals-0.10.tar.gz')
md5sums=('2912c1d6386f5ff70e13b8fc99b0c830')
sha512sums=('34b19a0792b7a15f818dedab5961442a32b8c9d55650fba287fbdf808c2215b471ebb2431d58c14570a7f3075f1c5dee77ef89eda9be0075d23a140679760eb4')
_distdir="Devel-StackTrace-WithLexicals-0.10"

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
