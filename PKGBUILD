# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-pod-strip'
pkgver='1.100'
pkgrel='1'
pkgdesc="Remove POD from Perl code"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Pod-Strip'
source=('http://search.cpan.org/CPAN/authors/id/D/DO/DOMM/Pod-Strip-1.100.tar.gz')
md5sums=('20382a30d2161fd5979fffc0960ee93b')
sha512sums=('292606ab93c6a8ab36383c498a42367103442cb398b775db975b1220f15b6f5c3d123caebb93add34a2f259b2acfa1ddecf5c2d24bc51ca0544e49013ab9e87a')
_distdir="Pod-Strip-1.100"

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
