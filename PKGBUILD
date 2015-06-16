# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-net-xwhois'
pkgver='0.90'
pkgrel='1'
pkgdesc="Whois Client Interface for Perl5."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Net-XWhois'
source=('http://search.cpan.org/CPAN/authors/id/V/VI/VIPUL/Net-XWhois-0.90.tar.gz')
md5sums=('1c0394d6a4b5bd05d8686b0a0dc18999')
sha512sums=('f64e1b519da2941baa8c95fe267fd69a565a6f6a9b64da2d3040d68e36816f4c5261925150b1766847d4a5947b01d8745e7d85c80127d9772c7903b64ac01d4e')
_distdir="Net-XWhois-0.90"

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
