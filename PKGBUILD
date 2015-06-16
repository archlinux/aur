# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-test-tinymocker'
pkgver='0.05'
pkgrel='1'
pkgdesc="a very simple tool to mock external modules"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Test-TinyMocker'
source=('http://search.mcpan.org/CPAN/authors/id/S/SU/SUKRIA/Test-TinyMocker-0.05.tar.gz')
md5sums=('b8c7b60c470ed383b049004a21b78dd9')
sha512sums=('71b36384f40b32e767211c3e34180743701e00642ed01e0fe7326c7dea6ecb0339c9e7fb4bc1a9e894517c22e4a0c6c226419597e269be70529a0165674fb4a5')
_distdir="Test-TinyMocker-0.05"

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
