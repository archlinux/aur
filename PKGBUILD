# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-uri-escape-xs'
pkgver='0.14'
pkgrel='1'
pkgdesc="Drop-In replacement for URI::Escape"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/URI-Escape-XS'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DANKOGAI/URI-Escape-XS-0.14.tar.gz')
md5sums=('b9fe3d87872103a989a9afc3e5366d55')
sha512sums=('acd24c468a140c7fc84a1280a9db305d1fb2a68450ef988f9e78d6b384e20196bc41d6bc7af249b904131d42f7a257440ea8051a62ac0daf24fc2913e69f97ca')
_distdir="URI-Escape-XS-0.14"

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
