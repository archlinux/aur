# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-checkmanifest'
pkgver='1.29'
pkgrel='1'
pkgdesc="Check if your Manifest matches your distro"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Test-CheckManifest'
source=('http://search.cpan.org/CPAN/authors/id/R/RE/RENEEB/Test-CheckManifest-1.29.tar.gz')
md5sums=('7ad56b6f7149b3b08f4030175deadb99')
sha512sums=('5844a950d623d3e96c75a6d5cc4dc545962b1f67348fca87251d84d1603da6b264e9c71bc272409731a645d8b04b92982b2fc7e4283e4ae6f3e560a53b6cb566')
_distdir="Test-CheckManifest-1.29"

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
