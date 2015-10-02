# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-cgi-ex'
pkgver='2.43'
pkgrel='1'
pkgdesc="CGI utility suite - makes powerful application writing fun and easy"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-template-alloy>=1.016')
makedepends=()
url='https://metacpan.org/release/CGI-Ex'
source=('http://search.cpan.org/CPAN/authors/id/L/LJ/LJEPSON/CGI-Ex-2.43.tar.gz')
md5sums=('77f12e63d85305930a0d845d454f9be5')
sha512sums=('caff23024299f35b14bf292ef725d25857983bade80dd1c24a0878eb8c35b87d85d7eb73db4baab585c748f67dd73d9449b213a1aa4c3c056a0ffa3b0ebbf9c7')
_distdir="CGI-Ex-2.43"

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
