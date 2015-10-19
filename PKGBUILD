# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-pithub'
pkgver='0.01030'
pkgrel='1'
pkgdesc="Github v3 API"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-array-iterator' 'perl-cache-lru>=0.04' 'perl-http-message' 'perl-import-into>=1.002004' 'perl-json-maybexs>=1.002000' 'perl-lwp-protocol-https' 'perl-moo>=1.001000' 'perl-path-tiny>=0.037' 'perl-libwww')
makedepends=()
checkdepends=('perl-test-most')
url='https://metacpan.org/release/Pithub'
source=('http://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/Pithub-0.01030.tar.gz')
md5sums=('d2d87bd77797fc24081d20d625a6929a')
sha512sums=('b3db47db87c46fc4113467d08f6514646d9de695240e957dd5cb420f8d639900f7b5a6af2608725ab6aca01dd4c769b871c8cb086b5f1a177638cbd47d3f57aa')
_distdir="Pithub-0.01030"

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
