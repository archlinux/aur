# Contributor: Bence Csókás <bence98  sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dublincore-record'
pkgver='0.03'
pkgrel='1'
pkgdesc="Container for Dublin Core metadata elements"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor>=0')
makedepends=()
url='https://metacpan.org/release/DublinCore-Record'
source=('http://search.cpan.org/CPAN/authors/id/B/BR/BRICAS/DublinCore-Record-0.03.tar.gz')
md5sums=('51354acc8ed6655f7ab901d358b0e15b')
sha512sums=('dfeb083ca944fa30897116bf199d5b31b674d36ad8783404975af3f5dca93124d25da921b57b793f2fce27649961b17060aa9d8acbb56cf73ddbc65946c1aa65')
_distdir="DublinCore-Record-0.03"

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
