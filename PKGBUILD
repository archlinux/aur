# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-moosex-traits'
pkgver='0.11'
pkgrel='1'
pkgdesc="automatically apply roles at object creation time"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=0.84' 'perl-namespace-autoclean' 'perl-sub-exporter')
makedepends=('perl-moose' 'perl-test-exception' 'perl-test-use-ok')
url='http://search.cpan.org/dist/MooseX-Traits'
source=('http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/MooseX-Traits-0.11.tar.gz')
md5sums=('5335a36eada2994e8d2b1346e8989113')
sha512sums=('3174a3761f42afbeb0e7be0e11beb7ab049ac4c645c43e68c90e9e665776910b23997caf5d73bd49b89753c6d1f9087c0ffcd61ad7683c631579b7e96bd298bf')
_distdir="MooseX-Traits-0.11"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
