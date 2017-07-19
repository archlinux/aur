# Maintainer: Michael Gerdau <mgd@qata.de>
# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: Drathir <drathir87@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-cryptx'
pkgver='0.050'
pkgrel='1'
pkgdesc="Crypto toolkit (self-contained no external libraries needed)"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/CryptX'
source=('https://cpan.metacpan.org/authors/id/M/MI/MIK/CryptX-0.050.tar.gz')
#source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIK/CryptX-0.050.tar.gz')
md5sums=('6c11d1035b230a13bfdc58980eb04b11')
sha512sums=('deb8e8a28e5a8ba0fa16373f9b1662051c75d958a7be66225c14356832dfd22136b0b88b2e0aa223ce0c8af5411e879fa6d20c45e18b87a1c8d78a04a6b5f781')
_distdir="CryptX-0.050"

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
