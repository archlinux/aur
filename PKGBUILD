# Maintainer: int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-authen-cas-client'
pkgver='0.08'
pkgrel='3'
pkgdesc="Perl/CPAN Module Authen::CAS::Client: Provides an easy-to-use interface for authentication using JA-SIG's Central Authentication Service"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-uri' 'perl-xml-libxml' 'perl-libwww' 'perl>=5.6.1')
makedepends=()
checkdepends=('perl-test-mockobject')
url='https://metacpan.org/release/Authen-CAS-Client'
source=('http://search.cpan.org/CPAN/authors/id/P/PR/PRAVUS/Authen-CAS-Client-0.08.tar.gz')
md5sums=('2f741fb2eb26a653ca50569c4048ce08')
sha512sums=('aabf0d1913aa8563d77e56e6af265f4d0da305a53c2f65cb7be3ed5ff5485d812cd2071ff547851b3ef15d229c416bf5c0f457c7be10571dd07c2972b8e0603f')
_distdir="Authen-CAS-Client-0.08"

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
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
