# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-data-stag'
pkgver='0.14'
pkgrel='1'
pkgdesc="Structured Tags datastructures"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-string')
makedepends=()
url='http://search.mcpan.org/dist/Data-Stag'
source=('http://search.cpan.org/CPAN/authors/id/C/CM/CMUNGALL/Data-Stag-0.14.tar.gz')
md5sums=('f803acf74f1bfccc118aeac5483ee871')
sha512sums=('72b0b5995795d593a844356e1955bd15e5c1cfc31934e55b748badcc21a29b7862475e7304bd56bd22086fcd31657a37f83acd8aee9343767c31dbfe8aba8e99')
_distdir="Data-Stag-0.14"

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
