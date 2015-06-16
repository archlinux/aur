# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-catalystx-component-traits'
pkgver='0.19'
pkgrel='1'
pkgdesc="Automatic Trait Loading and Resolution for Catalyst Components"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime>=0' 'perl-class-load>=0' 'perl-list-moreutils>=0' 'perl-moose>=0' 'perl-moosex-methodattributes>=0.15' 'perl-moosex-traits-pluggable>=0' 'perl-namespace-autoclean>=0')
makedepends=()
url='http://search.cpan.org/dist/CatalystX-Component-Traits'
source=('http://search.cpan.org/CPAN/authors/id/R/RK/RKITOVER/CatalystX-Component-Traits-0.19.tar.gz')
md5sums=('3abf5e3893f7eaa70ec862a6d6b92385')
sha512sums=('30c54c0a20085bb8215bb07e96c09cc66ff878458310db58bf141895f594f83858a51504e32e8b5c318afa5a03dca0ef2c64d52168d7d385eca361a0b8f42401')
_distdir="CatalystX-Component-Traits-0.19"

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
