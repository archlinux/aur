# Contributor: chimeracoder <dev@chimeracoder.net>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-moosex-params-validate'
pkgver='0.21'
pkgrel='1'
pkgdesc="an extension of Params::Validate using Moose's types"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-devel-caller>=0' 'perl-moose>=0.58' 'perl-params-validate>=0.88' 'perl-sub-exporter>=0')
makedepends=()
checkdepends=('perl-test-fatal>=0')
url='http://search.cpan.org/dist/MooseX-Params-Validate'
source=('http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/MooseX-Params-Validate-0.21.tar.gz')
md5sums=('6820bde80c022622bf9cb9aad27c48f6')
sha512sums=('73bca04f5368de3d5ac947b6002f8c0801c150fdf24f1d792772ffd36c85fe1095d694725de310cc465ab6e0794643ba372bbfd53595cc2a7f6f91d5df06377b')
_distdir="MooseX-Params-Validate-0.21"

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
