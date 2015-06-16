# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-pithub'
pkgver='0.01028'
pkgrel='1'
pkgdesc="Github v3 API"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-array-iterator' 'perl-cache-lru>=0.04' 'perl-http-message' 'perl-import-into>=1.002004' 'perl-json-maybexs>=1.002000' 'perl-lwp-protocol-https' 'perl-moo>=1.001000' 'perl-path-tiny>=0.037' 'perl-libwww')
makedepends=()
checkdepends=('perl-test-most')
url='http://search.mcpan.org/dist/Pithub'
source=('http://search.mcpan.org/CPAN/authors/id/M/MS/MSCHWERN/Pithub-0.01028.tar.gz')
md5sums=('d823856c606fa03092ed30a253df9edd')
sha512sums=('cccb39999f711bc2d1a9d9c939d2694f9b0c746b51420e515235f1e9c470252907b0b34f2f5d91ab31fa48c9c7224d74b75506d53af07d25a174938dff696663')
_distdir="Pithub-0.01028"

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
