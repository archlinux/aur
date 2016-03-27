# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Eduardo Leggiero <https://www.leggiero.uk/>

pkgname=perl-ntlm
pkgver=1.09
pkgrel=2
pkgdesc="Perl/CPAN module NTLM"
url="http://search.cpan.org/~nbebout/NTLM/"
license=('GPL')
arch=('any')
source=("http://search.cpan.org/CPAN/authors/id/N/NB/NBEBOUT/NTLM-${pkgver}.tar.gz")
sha256sums=('c823e30cda76bc15636e584302c960e2b5eeef9517c2448f7454498893151f85')

build() {
  cd ${srcdir}/NTLM-${pkgver}
  perl Makefile.PL INSTALLSITELIB=/usr/lib/perl5/site_perl/
  make
}

package(){
  cd ${srcdir}/NTLM-${pkgver}
  make DESTDIR=${pkgdir} install
}
