# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-test-sharedfork'
pkgver='0.29'
pkgrel='1'
pkgdesc="fork test"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-test-requires' 'perl')
makedepends=()
url='https://metacpan.org/release/Test-SharedFork'
source=('http://search.cpan.org/CPAN/authors/id/E/EX/EXODIST/Test-SharedFork-0.29.tar.gz')
md5sums=('acbc5baf82d78edf3771dfecaacd2345')
sha512sums=('ef392d615bc0be2fb04f27f0f1dcbaf8041a52242131c62d00357228b532087a50beae44bdb3d94f883a009741847641fed87665198b624139c762dcba5488ec')
_distdir="Test-SharedFork-0.29"

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
