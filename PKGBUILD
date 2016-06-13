# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-uri-encode'
pkgver='1.1.1'
pkgrel='1'
pkgdesc="Simple percent Encoding/Decoding"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/URI-Encode'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MITHUN/URI-Encode-v1.1.1.tar.gz')
md5sums=('54e0270f1d9ba1e2a3ed3698337114c6')
sha512sums=('69290a8e2cea1bf3e826bf8686f642e73258d316371638f3dbb86abc4b8e4ed468b11e8c4219e79e13dbb5307a56a6f022b9c756b8dc75221f8d78734ddefff5')
_distdir="URI-Encode-v1.1.1"

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
