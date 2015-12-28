# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-unicode-collate'
pkgver='1.14'
pkgrel='1'
pkgdesc="Unicode Collation Algorithm"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Unicode-Collate'
source=('http://search.cpan.org/CPAN/authors/id/S/SA/SADAHIRO/Unicode-Collate-1.14.tar.gz')
md5sums=('c486b31f87bfa3875883f3c9fad9fd99')
sha512sums=('a234c7ebb2f92886a68e39b681cb428bf99dd999f6a12ce137b132824072a07a60df3d26a4b147b2ec52c61df4f7c2fab5dad5cb40cce27fdff021cdf8208568')
_distdir="Unicode-Collate-1.14"

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
