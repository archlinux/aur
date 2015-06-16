# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-test-yaml-meta'
pkgver='0.20'
pkgrel='1'
pkgdesc="Validation of the META.yml file in a distribution."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-test-cpan-meta-yaml>=0.17' 'perl-test-yaml-valid>=0.03')
makedepends=()
url='http://search.cpan.org/dist/Test-YAML-Meta'
source=('http://search.cpan.org/CPAN/authors/id/B/BA/BARBIE/Test-YAML-Meta-0.20.tar.gz')
md5sums=('2edbc09069b916d2fdecef6990642562')
sha512sums=('52f215b53b91de07fcf5c4f2830f5089731d4e53cc54863bcde067feef94a82d3ce63fdbc8f57f2264cccfb0b07fe8d94e0b18e51bd9776bb167d3d5d8945f41')
_distdir="Test-YAML-Meta-0.20"

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
