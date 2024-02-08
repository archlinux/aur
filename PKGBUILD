# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-template-tiny'
pkgver='1.14'
pkgrel='1'
pkgdesc="Template Toolkit reimplemented in as little code as possible"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Template-Tiny'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Template-Tiny-1.14.tar.gz')
md5sums=('536563598c2bb3c3b763a9ecb8eaef01')
sha512sums=('8888fb6376401bec04e5bb3a09a76e600e964f1e22602409d7e340103518bdb4e407309d1ba170b63d66e144f764928d4c4c1d420285830a64752f50a5e79e8e')
_distdir="Template-Tiny-1.14"

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
