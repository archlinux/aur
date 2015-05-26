# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_author=GFLEWIS
_perlmod=ServiceNow-SOAP
pkgname=perl-servicenow-soap
pkgver=0.11
pkgrel=1
pkgdesc="A better Perl API for ServiceNow "
arch=('any')
url="https://metacpan.org/release/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=(
  'perl>=5.10.0'
  'perl-http-cookies'
  'perl-libwww'
  'perl-mime-types'
  'perl-soap-lite'
  'perl-xml-simple'
  )
options=(!emptydirs)
source=(http://cpan.metacpan.org/authors/id/${_author:0:1}/${_author:0:2}/$_author/$_perlmod-$pkgver.tar.gz)
md5sums=('dd7c36ab3ee11160500a285f7cd941b1')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make

}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"

}

# vim:set ts=2 sw=2 et:
