# Submitter  : gergan_penkov
# Maintainer : gergan_penkov
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-exception-died'
pkgver='0.06'
pkgrel='1'
pkgdesc="Convert simple die into real exception object"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-exception-base>=0.21' 'perl-constant-boolean>=0' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-assert>=0.05' 'perl-test-unit-lite>=0.11')
url='https://metacpan.org/release/Exception-Died'
source=('http://search.cpan.org/CPAN/authors/id/D/DE/DEXTER/Exception-Died-0.06.tar.gz')
md5sums=('b5be3ffa4c6e0e34fd73b77507de7f64')
sha512sums=('770c123b9f1f3f5d310ba5367c5630e8d8fa0e16cfa74a3d9301fad960b02590ecdf7eb00e77a3c4d56807a3b45a4ac9eb6579158300099dd7160fafc7f2df06')
_distdir="Exception-Died-0.06"

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
