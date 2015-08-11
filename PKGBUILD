# original Maintainer: DonVla <donvla@users.sourceforge.net>
# current Maintainer: achterin <headlock@its-crap.de>

pkgname=perl-mail-imapclient
_realname=Mail-IMAPClient
pkgver=3.35
pkgrel=1
pkgdesc="Perl/CPAN Module Mail::IMAPClient : An IMAP Client API"
arch=('any')
url="http://search.cpan.org/dist/Mail-IMAPClient"
license=('GPL' 'Artistic')
depends=('perl>=5.10.0' 'perl-parse-recdescent' 'perl-digest-hmac')
optdepends=("perl-authen-sasl: for Authmechanism 'DIGEST-MD5'")
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/P/PL/PLOBBES/${_realname}-${pkgver}.tar.gz)
md5sums=('b1d79827aeb28ba5f73a03eed5c540e6')
sha256sums=('8a4503833ce87d980be2d54603d94de4b365c2369eab19b095216506ce40f663')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"

  # Install module into the vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
