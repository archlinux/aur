# $Id: PKGBUILD 123966 2014-12-16 12:43:39Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Caleb Cushing <xenoterracide@gmail.com>

pkgname=perl-datetime-format-xsd
pkgver=0.2
pkgrel=0
pkgdesc="Parse and Format DateTimes using XSD"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime>=0.72' 'perl-datetime-locale>=0.45'
	 'perl-datetime-timezone>=0.79' 'perl-params-validate>=0.64')
url="http://search.cpan.org/~druoso/DateTime-Format-XSD-0.2/lib/DateTime/Format/XSD.pm"
source=("http://search.cpan.org/CPAN/authors/id/D/DR/DRUOSO/DateTime-Format-XSD-0.2.tar.gz")
md5sums=('8b78130ef8630d24935c8f1df3467a98')

build() {
  export PERL_MM_USE_DEFAULT=1
  cd "${srcdir}/DateTime-Format-XSD-${pkgver}"
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "${srcdir}/DateTime-Format-XSD-${pkgver}"
  make DESTDIR="$pkgdir" install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
