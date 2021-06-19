# Maintainer: Michael Gerdau <mgd@qata.de>
# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: Drathir <drathir87@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-cryptx'
pkgver='0.072'
pkgrel='1'
pkgdesc="Cryptographic toolkit"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/CryptX'
source=("http://search.cpan.org/CPAN/authors/id/M/MI/MIK/CryptX-${pkgver}.tar.gz")
md5sums=('c7b7ed132957c92ebd5b8acc62d09ea3')
sha512sums=('9e51181b14c08f8c0769089f8c9a5feefa7c4f1a8dff2501cf1d1d475ae162f8df35c7cceff9d1742552951e13450cac9d70eb1ead8178e0c95cd1abfea5e03c')
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
