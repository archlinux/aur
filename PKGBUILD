# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-pod-perldoc'
pkgver='3.25'
pkgrel='1'
pkgdesc="Look up Perl documentation in Pod format."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Pod-Perldoc'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MALLEN/Pod-Perldoc-3.25.tar.gz')
md5sums=('4991ce24fab9900312f11d9c8ab7576f')
sha512sums=('9374c3cfb79ed2e0c77607435559d9a11756eee9bbc638f5c570d20f5ee1278d92dc656b33d6699b8f001eae268ba76afc8524dcec3eb62abb77f4819ac0ba9b')
_distdir="Pod-Perldoc-3.25"

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
