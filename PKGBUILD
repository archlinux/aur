# Submitter  : gergan_penkov
# Maintainer : gergan_penkov
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-assert'
pkgver='0.0504'
pkgrel='1'
pkgdesc="Assertion methods for those who like JUnit."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-exception-base>=0.21' 'perl-symbol-util>=0.0202' 'perl-constant-boolean>=0.02' 'perl>=5.006')
makedepends=('perl-class-inspector>=0' 'perl-test-unit-lite>=0.11')
url='https://metacpan.org/release/Test-Assert'
source=('http://search.cpan.org/CPAN/authors/id/D/DE/DEXTER/Test-Assert-0.0504.tar.gz')
md5sums=('238dfef9e583a79d612eb59947eb1249')
sha512sums=('c630568cf483879c8180537ba0f9444b7e574de05be954e508a061889578c510689d4516ae22f49b824c20fbc8da1b25a8cc56f1f62e04353ee5c3e24fcb2a79')
_distdir="Test-Assert-0.0504"

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
