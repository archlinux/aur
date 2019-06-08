# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: François Charette <firmicus at gmx dot net>

pkgname=perl-xml-dom
pkgver=1.46
pkgrel=1
pkgdesc="Implements Level 1 of W3's DOM"
arch=('any')
url="http://search.cpan.org/dist/XML-DOM"
license=('GPL' 'PerlArtistic')
#'perlxml>=2.30'
depends=('perl-xml-regexp' 'libxml-perl>=0.07' 'perl-libwww')
options=('!emptydirs')
source=(http://www.cpan.org/authors/id/T/TJ/TJMATHER/XML-DOM-${pkgver}.tar.gz) 
md5sums=('91ec808de616a2af54a5118619f8f9cc')

build() {
  cd ${srcdir}/XML-DOM-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor 
  make
}

package() {
  cd ${srcdir}/XML-DOM-${pkgver}
  make install DESTDIR=${pkgdir}
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name '*.pod' -delete
}
