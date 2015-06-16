# Contributor: Christos Nouskas <nous@archlinux.us>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-json-maybexs'
pkgver='1.002002'
pkgrel='1'
pkgdesc="use Cpanel::JSON::XS with a fallback to JSON::XS and JSON::PP"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cpanel-json-xs>=2.3310' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-without-module>=0.17')
url='http://search.cpan.org/dist/JSON-MaybeXS'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/JSON-MaybeXS-1.002002.tar.gz')
md5sums=('cb8c66ece7518270ea31ffc4951d5f02')
sha512sums=('a4421abe54ec2b71892f4a1e04794dd3cc99773659cb32e8bf95a89db411eaadc6d90145be0a25da70946edded021962f6eaa48e7d8287773eb5d677ee042e7f')
_distdir="JSON-MaybeXS-1.002002"

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
