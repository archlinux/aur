# original Maintainer: DonVla <donvla@users.sourceforge.net>
# current Maintainer: achterin <headlock@its-crap.de>

pkgname=perl-mail-imapclient
_realname=Mail-IMAPClient
pkgver=3.42
pkgrel=1
pkgdesc="Perl/CPAN Module Mail::IMAPClient : An IMAP Client API"
arch=('any')
url="http://search.cpan.org/dist/Mail-IMAPClient"
license=('GPL' 'Artistic')
depends=('perl>=5.10.0' 'perl-parse-recdescent' 'perl-digest-hmac')
optdepends=("perl-authen-sasl: for Authmechanism 'DIGEST-MD5'")
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/P/PL/PLOBBES/${_realname}-${pkgver}.tar.gz)
md5sums=('7639380b85da4ad473dc50d6a78d3ad7')
sha256sums=('1c2264d50c54c839a3e38ce2f8edda3d24f30cc607940d7574beab19cb00ce7e')

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
