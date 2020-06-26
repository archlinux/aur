# Maintainer:  Michael Kogan <michael dot kogan at gmx dot net>

pkgname=perl-webservice-gyazo-b
pkgver=0.0406
pkgrel=1
pkgdesc="WebService::Gyazo::B - Perl image upload library for gyazo.com"
_dist="WebService-Gyazo-B"
arch=('i686' 'x86_64')
url="https://metacpan.org/pod/WebService::Gyazo::B"
license=('PerlArtistic')
depends=('perl-lwp-protocol-socks' 'perl-lwp-protocol-https' 'perl-http-message' 'perl-libwww' 'perl-uri-simple')
source=(https://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/WebService-Gyazo-B-$pkgver.tar.gz)
md5sums=('86261103ea10ca7df9795f6c2ec0b1b9')
options=('!emptydirs')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL
  ./Build
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs=vendor --destdir="$pkgdir"
}