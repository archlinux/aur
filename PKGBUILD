# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Zinc Chen <zinc.chen@live.cn>

pkgname=perl-net-interface
_cpanname=Net-Interface
pkgver=1.012
pkgrel=5
pkgdesc="Net::Interface - Perl extension to access network interfaces    "
arch=('i686' 'x86_64')
url="https://metacpan.org/release/${_cpanname}"
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/M/MI/MIKER/${_cpanname}-${pkgver}.tar.gz")
md5sums=('cfa0c390c506996c004fb5b214fc4a7c')

build() {
  cd "${srcdir}/${_cpanname}-${pkgver}"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make
}
package() {
  cd "${srcdir}/${_cpanname}-${pkgver}"
  make install DESTDIR="$pkgdir" || return 1
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}


