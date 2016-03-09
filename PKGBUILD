# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-rpc-xml'
pkgver='0.79'
pkgrel='1'
pkgdesc="A set of classes for core data, message and XML handling"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-xml-parser>=2.31' 'perl-libwww' 'perl' 'perl-xml-libxml')
makedepends=()
optdepends=('perl-net-server: Net::Server support')
url='https://metacpan.org/release/RPC-XML'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJRAY/RPC-XML-0.79.tar.gz')
md5sums=('64fb3a4a597574b97ea5c989edffb21d')
sha512sums=('541ee3abf4e44cff68a2b7b7c4f78095e8e4ec479d72b52d300503bc1688f64fd01a0ff3c2cdf8e18573d19af0bae467ac68befe7ad8756e6287ed494a50ce26')
_distdir="RPC-XML-0.79"

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
