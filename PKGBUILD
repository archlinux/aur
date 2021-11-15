# Maintainer: Cedric Girard <cgirard.archlinux@valinor.fr>
_author=GFLEWIS
_perlmod=ServiceNow-SOAP
pkgname=perl-servicenow-soap
pkgver=0.16
pkgrel=2
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
source=(https://cpan.metacpan.org/authors/id/${_author:0:1}/${_author:0:2}/$_author/$_perlmod-$pkgver.tar.gz)
sha256sums=('c2a35ddfe7ab4fd64d9553c53e6a1b5559b2fe8cd6aa54b30ccf44a1165c7949')

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
