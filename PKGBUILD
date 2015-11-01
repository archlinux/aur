# Submitter  : gergan_penkov
# Maintainer : gergan_penkov
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-routine'
pkgver='0.020'
pkgrel='1'
pkgdesc="composable units of assertion"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-load>=0' 'perl-moose>=0' 'perl-params-util>=0' 'perl-sub-exporter>=0' 'perl-test-fatal>=0' 'perl-try-tiny>=0' 'perl-namespace-autoclean>=0' 'perl-namespace-clean>=0')
makedepends=()
url='https://metacpan.org/release/Test-Routine'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Test-Routine-0.020.tar.gz')
md5sums=('62a15cc01d21d4f02266efad92fae303')
sha512sums=('4851bcf83c3422dd0f800d3093863a6a42ba07b9cb1d29f157fdd5fd5a6687e3042b6637a03afeb6864bf44644b4dc763ab1dd993d0d83f3592feff6f0b060a4')
_distdir="Test-Routine-0.020"

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
