# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-pod-elemental'
pkgver='0.103004'
pkgrel='1'
pkgdesc="work with nestable Pod elements"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-load>=0' 'perl-mixin-linewise>=0' 'perl-moose>=0' 'perl-moosex-types>=0' 'perl-pod-eventual>=0' 'perl-string-rewriteprefix>=0' 'perl-string-truncate>=0' 'perl-sub-exporter>=0' 'perl-sub-exporter-formethods>=0' 'perl-namespace-autoclean>=0')
makedepends=()
checkdepends=('perl-test-deep>=0' 'perl-test-differences>=0')
url='https://metacpan.org/release/Pod-Elemental'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Pod-Elemental-0.103004.tar.gz')
md5sums=('15458de0d87404ee94285633acadec9f')
sha512sums=('d2cae23f7c4131f74374f72aa52e58840035f2245d290f82594265089400fe669c0c03cf01c5b65688770b1b5eba6f611b60693b245af637711330fe8c617a66')
_distdir="Pod-Elemental-0.103004"

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
