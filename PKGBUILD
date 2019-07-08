# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mousex-getopt'
pkgver='0.38'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-getopt-long-descriptive>=0.091' 'perl-mouse>=0.64' 'perl-mousex-configfromfile>=0' 'perl-mousex-simpleconfig>=0')
makedepends=()
checkdepends=('perl-mouse>=0' 'perl-test-exception>=0.21' 'perl-test-warn>=0.21')
url='https://metacpan.org/release/MouseX-Getopt'
source=('https://cpan.metacpan.org/authors/id/G/GF/GFUJI/MouseX-Getopt-0.38.tar.gz')
md5sums=('d20571d847982922e8f1503223263a39')
sha512sums=('2a1f870f45f8b9ceae5f16421257f7b0b5fe97e09af9968686a00cbf320c56cfd6ad3ba7b2fcf714f22add98b0843a7e2b46f8d9b3c9ce36b2e9840b2ca5e621')
_distdir="MouseX-Getopt-0.38"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
   /usr/bin/perl Build.PL
   /usr/bin/perl Build
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  /usr/bin/perl Build test
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
