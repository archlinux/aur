# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-class-base'
pkgver='0.06'
pkgrel='1'
pkgdesc="useful base class for deriving other modules "
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Class-Base'
source=('http://search.cpan.org/CPAN/authors/id/S/SZ/SZABGAB/Class-Base-0.06.tar.gz')
md5sums=('73b1c3c87efd9fa327f9c6b1457235ae')
sha512sums=('095ed524914bac64bf5b2c2fddc6df94dd13c7a469da91857083ee0041bfbe993e6fa7c1245f1b987e6ebfa4f7393ea61c05d6396aacfe7ffabad417d529d2be')
_distdir="Class-Base-0.06"

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
