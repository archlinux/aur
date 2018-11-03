# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-cookie-baker'
pkgver='0.10'
pkgrel='2'
pkgdesc="Cookie string generator / parser"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-uri' 'perl')
makedepends=('perl-module-build-tiny')
checkdepends=('perl-test-time')
url='https://metacpan.org/release/Cookie-Baker'
source=("http://search.cpan.org/CPAN/authors/id/K/KA/KAZEBURO/Cookie-Baker-${pkgver}.tar.gz")
md5sums=('20f6f16689df949db86645652c1ebe38')
sha512sums=('e149885b3a561436daa8663f4ab55c5ebe41b6fce6ff3332ad58f840a9bb8098e36dbbb3dc15c4ce486245d3c5669a1cc450f112cb76346280a776179d54444f')
_distdir="Cookie-Baker-${pkgver}"

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
