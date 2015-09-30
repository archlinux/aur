# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-cpan-uploader'
pkgver='0.103010'
pkgrel='1'
pkgdesc="upload things to the CPAN"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-homedir' 'perl-getopt-long-descriptive>=0.084' 'perl-http-message' 'perl-lwp-protocol-https' 'perl-term-readkey' 'perl-libwww')
makedepends=()
url='https://metacpan.org/release/CPAN-Uploader'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/CPAN-Uploader-0.103010.tar.gz')
md5sums=('2dc364564c832d286ef324456e9e186c')
sha512sums=('b808a6010f83afec464217df97d8d913033fb52513d7499473e2f850dbc6cd6f89e17d0b5ceb7c753b3eb64222563497e5dd25c7cb4e51d5fc4c4964a9ef9b4d')
_distdir="CPAN-Uploader-0.103010"

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
