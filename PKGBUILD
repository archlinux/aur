# Maintainer: Patryk Kowalczyk < patryk at kowalczyk dot ws>

pkgname=perl-xml-dom-xpath
pkgname_=XML-DOM-XPath
pkgver=0.14
pkgrel=1
pkgdesc="Implements Level 1 of W3's DOM: XPath"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~mirod/XML-DOM-XPath-0.14/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perlxml>=2.30' 'perl-xml-regexp' 'libxml-perl>=0.07' 'perl-libwww' 'perl-xml-dom')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/M/MI/MIROD/XML-DOM-XPath-${pkgver}.tar.gz)

build() {
  cd ${srcdir}/${pkgname_}-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor 
  make
}

package() {
  cd ${srcdir}/${pkgname_}-${pkgver}
  make install DESTDIR=${pkgdir}
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name '*.pod' -delete
}
md5sums=('51a40df96c2f92829e1a4f84782fa75e')
