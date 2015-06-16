# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-lingua-pt-stemmer'
pkgver='0.01'
pkgrel='1'
pkgdesc="Portuguese language stemming"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Lingua-PT-Stemmer'
source=('http://search.cpan.org/CPAN/authors/id/X/XE/XERN/Lingua-PT-Stemmer-0.01.tar.gz')
md5sums=('74523d7da59dabbf561fa5cf60f98d02')
sha512sums=('601a6acc594fc73d153986b744807e56ce116e265c34403b0646681416ec482bb4bf9d2196eb3d463e4c3928c56c3f6fbd3ec971646b89008fa20965313a26ee')
_distdir="Lingua-PT-Stemmer-0.01"

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
