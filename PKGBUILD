# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-version-requirements'
pkgver='0.101022'
pkgrel='1'
pkgdesc="a set of version requirements for a CPAN dist"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Version-Requirements'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Version-Requirements-0.101022.tar.gz')
md5sums=('74e8a660969e30ffbb64999806c0769c')
sha512sums=('b91b3cb8d769702c3d517b858314239602576a6c1cceda4e461f7f75633f0ec5ed01b50afd76253b143942eac8e5a90a2b4c7ac162501148a76d36dbfd37183c')
_distdir="Version-Requirements-0.101022"

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
