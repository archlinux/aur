# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-script'
pkgver='1.18'
pkgrel='1'
pkgdesc="Basic cross-platform tests for scripts"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-ipc-run3>=0.034' 'perl-probe-perl>=0.01' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Test-Script'
source=('http://search.cpan.org/CPAN/authors/id/P/PL/PLICEASE/Test-Script-1.18.tar.gz')
md5sums=('50a6a63b270c44c9250d25aaedf080c9')
sha512sums=('c89e1dd68ca275744ac12811f0d66d42f8fd76766cc515e11e0df2a82beb8cc052253e19b04f5bc86d45e3a9a2a1d6afd5cd4707e8a97f3a9d4c1dd28e4a72b4')
_distdir="Test-Script-1.18"

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
