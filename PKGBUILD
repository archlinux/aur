# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=AWS-Signature4
cpanauthor=LDS
pkgname=perl-aws-signature4
pkgver=1.02
pkgrel=1
pkgdesc="Perl AWS::Signature4 CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('Artistic-2.0')
options=('!emptydirs')
depends=(
   'perl'
   'perl-timedate'
   'perl-libwww'
   'perl-uri'
)
makedepends=('perl-module-build')
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('20bbc16cb3454fe5e8cf34fe61f1a91fe26c3f17e449ff665fcbbb92ab443ebd')

build() {
	 cd "${srcdir}/${cpaname}-${pkgver}"
	 perl Build.PL
    perl Build
}

check() {
	 cd "${srcdir}/${cpaname}-${pkgver}"
	 perl Build test
}

package () {
	 cd "${srcdir}/${cpaname}-${pkgver}"
	 perl Build install destdir="${pkgdir}"
}
