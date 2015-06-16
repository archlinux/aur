# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-biblio-counter'
pkgver='0.11'
pkgrel='1'
pkgdesc="COUNTER Codes of Practice report processing"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-text-csv')
makedepends=()
url='http://search.cpan.org/dist/Biblio-COUNTER'
source=('http://search.cpan.org/CPAN/authors/id/N/NK/NKUITSE/Biblio-COUNTER-0.11.tar.gz')
md5sums=('64e7fb23d4d68b80f9e15d88ae205172')
sha512sums=('49803c624d42551a260f2f7b4e9d75365be2d57502221d1f5a4fb284481224116594ea4071d906ef757ef44a3eae474645b66b1318fd45511075068371e5cc6c')
_distdir="Biblio-COUNTER-0.11"

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
