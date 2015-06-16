# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-pod-spelling'
pkgver='0.17'
pkgrel='1'
pkgdesc="Send POD to a spelling checker"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-pod-pom>=0.04')
makedepends=('perl-test-pod')
url='http://search.cpan.org/dist/Pod-Spelling'
source=('http://search.cpan.org/CPAN/authors/id/L/LG/LGODDARD/Pod-Spelling-0.17.tar.gz')
md5sums=('9240a8c7b6d9531f508fa27ec08c3c70')
sha512sums=('e4b7418d73b5b0addc821475942437e1257fc87318d23d88a2b83a306ab6f71df0af1758ce77a82782424aac9d24518b5392c06421affa659634555658926550')
_distdir="Pod-Spelling-0.17"

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
