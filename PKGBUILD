# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-sub-attribute'
pkgver='0.05'
pkgrel='1'
pkgdesc="Reliable subroutine attribute handlers"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=('perl-mro-compat>=0.09')
url='https://metacpan.org/release/Sub-Attribute'
source=('http://search.cpan.org/CPAN/authors/id/G/GF/GFUJI/Sub-Attribute-0.05.tar.gz')
md5sums=('9dd0fd69918dbfcd070d2f7fe1e0d4f8')
sha512sums=('e152f78ce3576116252d44dd687cb7a818a154f4bc6b1155d962ebfe26d8e9ecbf6d01db1ee6d10e505b5ffa1f4b2a9c32103a0ea082be38d1bbeb9b6407e456')
_distdir="Sub-Attribute-0.05"

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
