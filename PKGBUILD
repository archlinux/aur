# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-news-nntpclient
pkgver=0.37
pkgrel=1
pkgdesc="Perl 5 module to talk to NNTP (RFC977) server"
arch=('any')
url="https://metacpan.org/dist/NNTPClient"
license=('GPL' 'PerlArtistic')
depends=('perl')
source=("https://www.cpan.org/modules/by-module/News/NNTPClient-${pkgver}.tar.gz")
sha512sums=('7179a4cb96ba877c7f870fa2e3edc91e3811e1db99ae5a05a0eec47febda69ecd231f4658f2253f59295262737f91f92462bc5d6a18dd2da2580f7565e976863')

build() {
  cd "${srcdir}/NNTPClient-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

# These tests do not work without a news server
#check() {
#  cd "${srcdir}/NNTPClient-${pkgver}"
#
#  make test
#}

package() {
  cd "${srcdir}/NNTPClient-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
