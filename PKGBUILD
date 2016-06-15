# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-bezier'
pkgver='0.01'
pkgrel='1'
pkgdesc="solution of Bezier Curves"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Math-Bezier'
source=('http://search.cpan.org/CPAN/authors/id/A/AB/ABW/Math-Bezier-0.01.tar.gz')
md5sums=('ba6874d8754e2d64ab9c7d15e0eb56c2')
sha512sums=('dc8facf3bde3a763cd18e2459fc4f3c1b4736b6f13b13144cf5b9633725fd5b7b52cff77a1815ee897f36d5b52d4ae9e9a47c3ed6d02977b2dbef815ee704bec')
_distdir="Math-Bezier-0.01"

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
