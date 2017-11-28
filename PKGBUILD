# Maintainer: Michael Gerdau <mgd@qata.de>
# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: Drathir <drathir87@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-cryptx'
pkgver='0.055'
pkgrel='1'
pkgdesc="Crypto toolkit (self-contained no external libraries needed)"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/CryptX'
source=("https://cpan.metacpan.org/authors/id/M/MI/MIK/CryptX-${pkgver}.tar.gz")
md5sums=('838bb52e26acd0fe9794f30eb807501a')
sha512sums=('51dfa6cbb4d3e38c61a68efc474bdb750c6de544f30c86ab1dbb0a01e3f3d6d294b93fbf7830ea917cd65c7a054b6cb5c18ea6cf54b0921eb017e419a36b76cb')
_distdir="CryptX-${pkgver}"

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
