# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-class-c3'
pkgver='0.31'
pkgrel='1'
pkgdesc="A pragma to use the C3 method resolution order algorithm"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-algorithm-c3>=0.07' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Class-C3'
source=('http://search.cpan.org/CPAN/authors/id/H/HA/HAARG/Class-C3-0.31.tar.gz')
md5sums=('81b5258e533d737086d8bc36b869dd90')
sha512sums=('f299e69e6ecfb51536babe89994a66e44179583c1e43cb79e23072f82db35ca3d2cabbc8119bdd59ed7d2119337ada79e55338a6d7b8509a40ea7896cd7f6173')
_distdir="Class-C3-0.31"

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
