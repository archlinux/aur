# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-lexical-sealrequirehints'
pkgver='0.011'
pkgrel='1'
pkgdesc="prevent leakage of lexical hints"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-build>=0' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Lexical-SealRequireHints'
source=('http://search.cpan.org/CPAN/authors/id/Z/ZE/ZEFRAM/Lexical-SealRequireHints-0.011.tar.gz')
md5sums=('210635d5316693885eb328986ef8e1d8')
sha512sums=('b31d3527e3ea1d28ebcac58cfdb35893643c7c371dba96cf06509cc7b1ce61c38f6cc37f420c2ec93b0a57adfc3d3cd797af97fad9aeb6e1000ef1769e26c31e')
_distdir="Lexical-SealRequireHints-0.011"

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
