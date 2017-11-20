# original Maintainer: DonVla <donvla@users.sourceforge.net>
# current Maintainer: achterin <headlock@its-crap.de>

pkgname=perl-mail-imapclient
_realname=Mail-IMAPClient
pkgver=3.39
pkgrel=1
pkgdesc="Perl/CPAN Module Mail::IMAPClient : An IMAP Client API"
arch=('any')
url="http://search.cpan.org/dist/Mail-IMAPClient"
license=('GPL' 'Artistic')
depends=('perl>=5.10.0' 'perl-parse-recdescent' 'perl-digest-hmac')
optdepends=("perl-authen-sasl: for Authmechanism 'DIGEST-MD5'")
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/P/PL/PLOBBES/${_realname}-${pkgver}.tar.gz)
md5sums=('b813cfd79a7cab4e886d9caa94991502')
sha256sums=('b541fdb47d5bca93048bcee69f42ad2cc96af635557ba6a9db1d8f049a434ea3')

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
