# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-hook-lexwrap'
pkgver='0.25'
pkgrel='1'
pkgdesc="Lexically scoped subroutine wrappers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Hook-LexWrap'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Hook-LexWrap-0.25.tar.gz')
md5sums=('140af3d36b3e80dce414b9a68adf0ad8')
sha512sums=('63623164ac67a33bd12ef771725a09647bdfe19d2f8eb84a0049ca0bdf4adc325143889a5751b1aefaca23eedb1a503ee42071b2fe3e7e3f033c148c0716eca9')
_distdir="Hook-LexWrap-0.25"

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
