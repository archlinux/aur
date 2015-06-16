# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-moosex-singleton'
pkgver='0.29'
pkgrel='1'
pkgdesc="turn your Moose class into a singleton"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=1.10')
makedepends=('perl-test-fatal' 'perl-test-requires')
url='http://search.cpan.org/dist/MooseX-Singleton'
source=('http://search.cpan.org/CPAN/authors/id/K/KA/KAARE/MooseX-Singleton-0.29.tar.gz')
md5sums=('b4ea5f8cc9b9f952623527a52da55e8d')
sha512sums=('bfaf99127488f75f40c6df309360da1be67290865ffb962e1c6e694858d055723ccbe8bc199fff592525b04a428007376bcd515bf095baa9f0bc193d72c277fb')
_distdir="MooseX-Singleton-0.29"

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
