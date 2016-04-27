# original Maintainer: DonVla <donvla@users.sourceforge.net>
# current Maintainer: achterin <headlock@its-crap.de>

pkgname=perl-mail-imapclient
_realname=Mail-IMAPClient
pkgver=3.38
pkgrel=1
pkgdesc="Perl/CPAN Module Mail::IMAPClient : An IMAP Client API"
arch=('any')
url="http://search.cpan.org/dist/Mail-IMAPClient"
license=('GPL' 'Artistic')
depends=('perl>=5.10.0' 'perl-parse-recdescent' 'perl-digest-hmac')
optdepends=("perl-authen-sasl: for Authmechanism 'DIGEST-MD5'")
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/P/PL/PLOBBES/${_realname}-${pkgver}.tar.gz)
md5sums=('81890b7764ebfae96cf66262c6aea9af')
sha256sums=('d0f346d111dba93548ceac1192a993210ffcd5f81f83638ee277607bfacc1a4d')

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
