# Maintainer: Jason Ryan <jasonwryan@gmail.com>
# Contributor: Yuval Hager <yhager@yhager.com>

pkgname=perl-data-ical
_perlname=Data-ICal
pkgver=0.21
pkgrel=1
pkgdesc="Generates iCalendar (RFC 2445) calendar files"
arch=('any')
url=("https://metacpan.org/release/${_perlname}/")
license=('GPL' 'PerlArtistic')
depends=('perl>=5.12' 'perl-dbi>=1.30')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/A/AL/ALEXMV/${_perlname}-${pkgver}.tar.gz")
md5sums=('6b5a8286d906264d82a372e33594c5d0')

build() {
  cd "$srcdir/${_perlname}-${pkgver}"
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
    make 
}

package() {
  cd "$srcdir/${_perlname}-${pkgver}"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# vim:set ts=2 sw=2 et:
