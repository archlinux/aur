# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=VM-EC2
cpanauthor=LDS
pkgname=perl-vm-ec2
pkgver=1.28
pkgrel=1
pkgdesc="Perl VM::EC2 CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=(
   'perl'
   'perl-anyevent'
   'perl-anyevent-cachedns'
   'perl-anyevent-http'
   'perl-aws-signature4'
   'perl-json'
   'perl-libwww'
   'perl-string-approx'
   'perl-uri'
   'perl-xml-simple'
)
makedepends=('perl-module-build')
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('b2b6b31745c57431fca0efb9b9d0b8f168d6081755e048fd9d6c4469bd108acd')

build() {
	 cd "${srcdir}/${cpaname}-${pkgver}"
	 perl Build.PL
	 perl Build
}

package () {
	 cd "${srcdir}/${cpaname}-${pkgver}"
	 perl Build install destdir="${pkgdir}"
}
