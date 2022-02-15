# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-net-caldavtalk
pkgver=0.12
pkgrel=1
pkgdesc="Module to talk CalDAV and give a JSON interface to the data"
arch=('any')
url="https://metacpan.org/dist/Net-CalDAVTalk"
license=('Artistic2.0')
depends=('perl' 'perl-data-ical-timezone' 'perl-datetime-format-ical'
         'perl-datetime-format-iso8601' 'perl-datetime-timezone' 'perl-json'
         'perl-json-xs' 'perl-mime-types' 'perl-net-davtalk'
         'perl-text-levenshteinxs' 'perl-text-vcardfast')
checkdepends=('perl-test-pod' 'perl-test-pod-coverage')
source=("https://www.cpan.org/modules/by-module/Net/Net-CalDAVTalk-${pkgver}.tar.gz")
sha512sums=('29ec639a27f20e6573b0701b963ec851606a0a5eb612619d5640f280200885665fc73dcdcc14096f2e4336f360402e9f5b95c1e425d58c3ae388b77e765c45f8')

build() {
  cd "${srcdir}/Net-CalDAVTalk-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Net-CalDAVTalk-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Net-CalDAVTalk-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
