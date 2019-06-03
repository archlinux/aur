# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-encoding-handleutf8'
pkgver='0.004'
pkgrel='1'
pkgdesc="Fix the encoding for Perl value store (input) and general output (output) to a console or the web."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-clone>=0' 'perl-encoding-fixlatin>=0' 'perl>=5.010')
makedepends=()
checkdepends=('perl-test-nowarnings>=0' 'perl-test-warn>=0')
url='https://metacpan.org/release/Encoding-HandleUtf8'
source=('http://search.cpan.org/CPAN/authors/id/B/BU/BURNERSK/Encoding-HandleUtf8-0.004.tar.gz')
md5sums=('aa6e3a30828965b033c3654ddd3656cd')
sha512sums=('678fcdffee7ab17100a45941b8a79f8d7095bf70796603430f721dd0097aeb8204eb4c8cdfc3e8df0249e1d6b4fc4ba14429f099459591c1c2af7cbbf24dd6d6')
_distdir="Encoding-HandleUtf8-0.004"

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
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
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
