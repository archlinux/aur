# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-type-tiny-xs'
pkgver='0.025'
pkgrel='1'
pkgdesc="provides an XS boost for some of Type::Tiny's built-in type constraints"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.5')
makedepends=()
url='https://metacpan.org/release/Type-Tiny-XS'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/Type-Tiny-XS-0.025.tar.gz')
md5sums=('1f34b61b0f708a4cc49bd745a4387a14')
sha512sums=('c990733efd4f057730ded8b7b2530251254ccaf1fb4398ff31ba12fe41c61cb24e817be20adc29002ab6281f703ba20c00f563b6e43e4983bc02d3aa7d0ceeee')
_distdir="Type-Tiny-XS-0.025"

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
