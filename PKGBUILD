# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-uri-db'
pkgver='0.19'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-build>=0.30' 'perl-uri>=1.40' 'perl-uri-nested>=0.10')
makedepends=()
url='https://metacpan.org/release/URI-db'
source=('http://search.cpan.org/CPAN/authors/id/D/DW/DWHEELER/URI-db-0.19.tar.gz')
md5sums=('b4b5407c6b2c65ad0e5bbbf3721d12a0')
sha512sums=('4263bc58acadfc61eb4269392e5924fa349138c6a14584ee754b12669787c22c6228a66034c191bd934126bc3120f10188f50daf5a5a81605efa89442093e146')
_distdir="URI-db-0.19"

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
