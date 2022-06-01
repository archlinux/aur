# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-catalyst-plugin-static-simple'
pkgver='0.37'
pkgrel='2'
pkgdesc="Make serving static pages painless."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime>=5.80008' 'perl-mime-types>=2.03' 'perl-moose>=0' 'perl-namespace-autoclean>=0')
makedepends=()
url='https://metacpan.org/release/Catalyst-Plugin-Static-Simple'
source=("https://cpan.metacpan.org/authors/id/I/IL/ILMARI/Catalyst-Plugin-Static-Simple-$pkgver.tar.gz")
md5sums=('b7c609aa71217b8f6f65554e33be9ee6')
sha512sums=('6901c6ebdd73caecd5f6c21017be82f62537efd2fc466fd96be0593a5fa946419c1d25b1b97520825d34d731d90b8c358f169bc252194fd40281e8e0e1721d15')
_distdir="Catalyst-Plugin-Static-Simple-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
