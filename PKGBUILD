# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

_perlmod=Text-CHM
_modnamespace=Text
pkgname=perl-text-chm
pkgver=0.01
pkgrel=3
pkgdesc="Perl Text::CHM - Extension for handling MS Compiled HtmlHelp Files"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/${_perlmod}"
license=('PerlArtistic')
depends=('perl' 'chmlib')
source=("http://cpan.org/modules/by-module/${_modnamespace}/${_perlmod}-${pkgver}.tar.gz")
sha256sums=('9685ce7481baf0cb5ff1e694c2ae5ba6ae5e251dbb3dcf1300150fd08be6c3ac')
options=('!emptydirs')

build() {
  cd "${_perlmod}-${pkgver}"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "${_perlmod}-${pkgver}"
  make install DESTDIR="${pkgdir}"
  find "${pkgdir}" -name '.packlist' -delete
  find "${pkgdir}" -name '*.pod' -delete
}
