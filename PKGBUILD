# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=VM-EC2-Security-CredentialCache
cpanauthor=RCONOVER
pkgname=perl-vm-ec2-security-credentialcache
pkgver=0.25
pkgrel=1
pkgdesc="Perl VM::EC2::Security::CredentialCache CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=(
   'perl'
   'perl-datetime-format-iso8601'
   'perl-vm-ec2'
)
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('fc7e9c152ff2b721ccb221ac40089934775cf58366aedb5cc1693609f840937b')

build() {
	 cd "${srcdir}/${cpaname}-${pkgver}"
	 perl Makefile.PL
	 make
}

check() {
	 cd "${srcdir}/${cpaname}-${pkgver}"
	 make test
}

package () {
	 cd "${srcdir}/${cpaname}-${pkgver}"
	 make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
