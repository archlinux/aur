# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-uri-db'
pkgver='0.17'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-build>=0.30' 'perl-uri>=1.40' 'perl-uri-nested>=0.10')
makedepends=()
url='https://metacpan.org/release/URI-db'
source=('http://search.cpan.org/CPAN/authors/id/D/DW/DWHEELER/URI-db-0.17.tar.gz')
md5sums=('492b2fcf576a11a56f9984418ed02bcf')
sha512sums=('31e7284e7662d11c3b27c4f232d023b610187d82d17b5cc2ea3519a5a759a91d8b36f3a3947a905e516a92ebab5201f2a696b479cf95c2b5fdf43f797b4f6a12')
_distdir="URI-db-0.17"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
