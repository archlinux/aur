# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-cookie-baker'
pkgver='0.11'
pkgrel='1'
pkgdesc="Cookie string generator / parser"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-uri' 'perl')
makedepends=('perl-module-build-tiny')
checkdepends=('perl-test-time')
url='https://metacpan.org/release/Cookie-Baker'
source=("http://search.cpan.org/CPAN/authors/id/K/KA/KAZEBURO/Cookie-Baker-${pkgver}.tar.gz")
md5sums=('bc8f95893d6ec3093a62d1957e1908f2')
sha512sums=('0b75d9c74e1daa5d4dd63febd887e6c4825fd1df5f56335bf733b5bf2f24a56f6b76728259799aaf4dedf27efae90c238962585956608b1408a67164c3759ed2')
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
