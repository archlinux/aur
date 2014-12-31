# Maintainer: Patryk Kowalczyk < patryk at kowalczyk dot ws>
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 0.16
pkgname='perl-xml-xpathengine'
pkgver='0.14'
pkgrel=1
pkgdesc="a re-usable XPath engine for DOM-like trees"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
makedepends=('perl')
url='http://search.cpan.org/dist/XML-XPathEngine'
source=("http://search.cpan.org/CPAN/authors/id/M/MI/MIROD/XML-XPathEngine-$pkgver.tar.gz")

build() {
  _DISTDIR="${srcdir}/XML-XPathEngine-$pkgver"
  export PERL_MM_USE_DEFAULT=1
  cd "$_DISTDIR"
  perl Makefile.PL INSTALLDIRS=vendor
  make
  make test
}

package() {
  _DISTDIR="${srcdir}/XML-XPathEngine-$pkgver"
  export PERL_MM_USE_DEFAULT=1
  cd "$_DISTDIR"
  make DESTDIR="${pkgdir}/" install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}



md5sums=('d840cbefa57c23041f0bed14940a6b22')
