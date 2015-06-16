# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-template-provider-encoding'
pkgver='0.10'
pkgrel='1'
pkgdesc="Explicitly declare encodings of your templates"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-template-toolkit')
makedepends=()
url='http://search.cpan.org/dist/Template-Provider-Encoding'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Template-Provider-Encoding-0.10.tar.gz')
md5sums=('fddbc7b4c2033d931932880149cab323')
sha512sums=('ed9b7d091331670eb86b9c93f5cc65e2094cde083603093a3b759e8de8604f054d98e5cf4fe299edce1110c5cf58b79b2ed9d5394d26fdb113ad01d382428a86')
_distdir="Template-Provider-Encoding-0.10"

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
