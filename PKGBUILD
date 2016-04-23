# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-tempdir-tiny'
pkgver='0.016'
pkgrel='1'
pkgdesc="Temporary directories that stick around when tests fail"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Test-TempDir-Tiny'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Test-TempDir-Tiny-0.016.tar.gz')
md5sums=('03c47a960655f5b39a0ce813dcc51b17')
sha512sums=('33dcdef18e2f906d7dc5981c353c2fc1d65c60ad15e800fb0726d63be6d333cd56007764c0c8876cc7fac6d3b113ea78b9e62f76801382602ac62b3d96e89827')
_distdir="Test-TempDir-Tiny-0.016"

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
