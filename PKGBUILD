# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-app-find2perl'
pkgver='1.003'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-devel-findperl>=0.009')
makedepends=()
url='https://metacpan.org/release/App-find2perl'
source=('http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/App-find2perl-1.003.tar.gz')
md5sums=('5b4fc19e1f4576ee044c23d2ba7024bd')
sha512sums=('b7153253e07efd5ffbb49f6a5f88a19360b921375fe6d97d58296c69f17c518ed84e2a2f2e742f02537966c3f314ab828cbf24df4d1d9ef8b9ccf822fa673d67')
_distdir="App-find2perl-1.003"

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
