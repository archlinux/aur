# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-cql-parser'
pkgver='1.12'
pkgrel='1'
pkgdesc="compiles CQL strings into parse trees of Node subtypes."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-class-accessor>=0.1' 'perl-clone>=0.15' 'perl-string-tokenizer>=0.05')
makedepends=('perl-test-exception')
url='http://search.cpan.org/dist/CQL-Parser'
source=('http://search.cpan.org/CPAN/authors/id/B/BR/BRICAS/CQL-Parser-1.12.tar.gz')
md5sums=('51101eec70646bda06de940dc698fbe0')
sha512sums=('f894aa659926329d32bf13827b2414b590750716b74105f0c9d5c7e0a751bfdfe73eb1cda24090fc840a9c1b7f8ceaacb22c061afc43ddea3df1039b8298d9da')
_distdir="CQL-Parser-1.12"

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
