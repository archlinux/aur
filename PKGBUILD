# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Amazon-SES
cpanauthor=RCONOVER
pkgname=perl-amazon-ses
pkgver=0.06
pkgrel=1
pkgdesc="Perl Amazon::SES CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=(
   'perl'
   'perl-aws-signature4'
   'perl-email-sender'
   'perl-http-headers-fast'
   'perl-http-message'
   'perl-json-xs'
   'perl-kavorka'
   'perl-lwp-useragent-cached'
   'perl-mime-tools'
   'perl-moo'
   'perl-moops'
   'perl-moox-types-mooselike-numeric'
   'perl-vm-ec2-security-credentialcache'
   'perl-xml-simple'
)
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('470f3c5b2ee88fc5173cad68c780fdb7a320b8bff6f044d9924b11cb44b8c240')

build() {
	 cd "${srcdir}/${cpaname}-${pkgver}"
	 perl Makefile.PL
	 make
}

package () {
	 cd "${srcdir}/${cpaname}-${pkgver}"
	 make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
