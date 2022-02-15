# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-net-carddavtalk
pkgver=0.09
pkgrel=1
pkgdesc="A library for talking to CardDAV servers"
arch=('any')
url="https://metacpan.org/dist/Net-CardDAVTalk"
license=('Artistic2.0')
depends=('perl' 'perl-timedate' 'perl-file-mmagic' 'perl-list-moreutils'
         'perl-list-pairwise' 'perl-net-davtalk' 'perl-text-vcardfast'
         'perl-xml-spice')
checkdepends=('perl-test-pod')
source=("https://www.cpan.org/modules/by-module/Net/Net-CardDAVTalk-${pkgver}.tar.gz")
sha512sums=('daf232db826e5febcd0b2fc08b0a0d3c3e3b2f748691175c56483ffbd38b9da8f4bc0afb3d405942c90e48ae531560563a504d40e39b021a4416cc20274e40db')

build() {
  cd "${srcdir}/Net-CardDAVTalk-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Net-CardDAVTalk-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Net-CardDAVTalk-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
