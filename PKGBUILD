# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-app-find2perl'
pkgver='1.005'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-devel-findperl>=0.009')
makedepends=()
url='https://metacpan.org/release/App-find2perl'
source=('http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/App-find2perl-1.005.tar.gz')
md5sums=('0adc6256c08f593c5eda1cc795b3e4fd')
sha512sums=('5bd08eb3431a423b1eaf3bb79e11c3650c8212b8f222e16fbc613bbef86cd843d0ff1afb36b3513bb608e769bfe2966fc9325fa1b2c39c3594257d74c66d5255')
_distdir="App-find2perl-1.005"

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
