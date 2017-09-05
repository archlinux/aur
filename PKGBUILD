# Maintainer: Jason Ryan <jasonwryan@gmail.com>
# Contributor: Yuval Hager <yhager@yhager.com>

pkgname=perl-data-ical
_perlname=Data-ICal
pkgver=0.22
pkgrel=3
pkgdesc="Generates iCalendar (RFC 2445) calendar files"
arch=('any')
url="https://metacpan.org/release/${_perlname}/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.12' 'perl-dbi>=1.30') 
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/A/AL/ALEXMV/${_perlname}-${pkgver}.tar.gz")
md5sums=('7ba398c22481d8de8e2bb317173b3483')

build() {
    cd "$srcdir/${_perlname}-${pkgver}"
    PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_USE_UNSAFE_INC=1 perl Makefile.PL 
    make
}

package() {
  cd "$srcdir/${_perlname}-${pkgver}"
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:
