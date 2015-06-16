# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-data-dpath-validator'
pkgver='0.093411'
pkgrel='1'
pkgdesc="Validate data based on Perl data structure templates"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-dpath>=0.32' 'perl-data-visitor>=0.26' 'perl-moose>=0.93' 'perl-moosex-role-buildinstanceof>=0.02' 'perl-moosex-types>=0.20' 'perl-namespace-autoclean>=0.09')
makedepends=()
url='http://search.cpan.org/dist/Data-DPath-Validator'
source=('http://search.cpan.org/CPAN/authors/id/N/NP/NPEREZ/Data-DPath-Validator-0.093411.tar.gz')
md5sums=('7a942f968e958789b6c88e46b2501781')
sha512sums=('1304fc8c8414b149a3dca36e2b600d4a3f57913d7805a1359c7826b1ec31ef893a5d5e688f422533de62598ad5cdca60bdd750c96689a8ecccfb57a7653df729')
_distdir="Data-DPath-Validator-0.093411"

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
