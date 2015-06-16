# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-plugin-session-store-delegate'
pkgver='0.06'
pkgrel='1'
pkgdesc="Delegate session storage to an"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-plugin-session>=0.27' 'perl-moose' 'perl-moosex-emulate-class-accessor-fast' 'perl-mro-compat' 'perl-namespace-clean')
makedepends=('perl-test-use-ok')
url='http://search.cpan.org/dist/Catalyst-Plugin-Session-Store-Delegate'
source=('http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/Catalyst-Plugin-Session-Store-Delegate-0.06.tar.gz')
md5sums=('daa73e910e3ec47fd7abc31642cc65aa')
sha512sums=('915d632600149da20e6d976c4104567e6fc3edbc9d64675e1d1fbb13b00f0bda4cdbd161ffb3e349ccc4fc130d5c72345a512afb8f8fdfe1694c7646741ff382')
_distdir="Catalyst-Plugin-Session-Store-Delegate-0.06"

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
