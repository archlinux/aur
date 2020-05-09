# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-parallel-forker'
pkgver='1.254'
pkgrel='1'
pkgdesc="Parallel job forking and management, with expression based control"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-proc-processtable>=0.4')
makedepends=()
url='http://search.cpan.org/dist/Parallel-Forker'
source=("https://cpan.metacpan.org/authors/id/W/WS/WSNYDER/Parallel-Forker-${pkgver}.tar.gz")
sha512sums=('99aa078255e429dece2f0449c7d4dfe07f8e95ea91c0d541ff3c5d5879e538994cd977b8ebf1145daed5a369b2867a4476073f76a883ac0db2c2f3c91ade6e7c')
_distdir="Parallel-Forker-${pkgver}"

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
