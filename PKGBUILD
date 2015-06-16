# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-model-adaptor'
pkgver='0.10'
pkgrel='1'
pkgdesc="use a plain class as a Catalyst model"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime' 'perl-mro-compat')
makedepends=('perl-test-use-ok')
url='http://search.cpan.org/dist/Catalyst-Model-Adaptor'
source=('http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/Catalyst-Model-Adaptor-0.10.tar.gz')
md5sums=('06756b1c13ebe84d3f2538975cfea978')
sha512sums=('f30a780a133119b25d5149ca03452804fd7d9ea38c59313268beb2de50cd70096af9540b818c3d182d8743abd96818c0ab6b5ebd33e8f07e3c19530d96cc3413')
_distdir="Catalyst-Model-Adaptor-0.10"

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
