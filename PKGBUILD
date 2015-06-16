# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-html-wikiconverter'
pkgver='0.68'
pkgrel='1'
pkgdesc="Convert HTML to wiki markup"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-data-inheritable>=0.02' 'perl-css>=1.07' 'perl-html-parser' 'perl-html-tagset>=3.04' 'perl-html-tree>=3.18' 'perl-params-validate>=0.77' 'perl-uri>=1.35')
makedepends=()
url='http://search.cpan.org/dist/HTML-WikiConverter'
source=('http://search.cpan.org/CPAN/authors/id/D/DI/DIBERRI/HTML-WikiConverter-0.68.tar.gz')
md5sums=('e6d8b16c23b6f38c51d8585f3423aca9')
sha512sums=('e80e9053dd01dfbea587ed2816a282abc4083021d3d80b72b1e2ea2d1ce0b45226bcf0c863beddc7a2bc15fece7b8bfa78e33ee409460776a5ef2de57beae7ee')
_distdir="HTML-WikiConverter-0.68"

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
