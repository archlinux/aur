# Maintainer: Michael Gerdau <mgd@qata.de>
# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: Drathir <drathir87@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-cryptx'
pkgver='0.049'
pkgrel='1'
pkgdesc="Crypto toolkit (self-contained no external libraries needed)"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/CryptX'
source=('https://cpan.metacpan.org/authors/id/M/MI/MIK/CryptX-0.049.tar.gz')
#source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIK/CryptX-0.049.tar.gz')
md5sums=('632e8d4a9ada3c05cdf0967ce5978a38')
sha512sums=('f424bc547d88b91f3475d8908c2870f05ed655ad001243e94f761e3fde1a476943c12e0cecc2614269968aca3b88ae77db1af8d9eb4333daa741ba0bfcc80c77')
_distdir="CryptX-0.049"

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
