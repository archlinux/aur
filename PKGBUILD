# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=perl-goo-canvas2
pkgver=0.06
pkgrel=2
pkgdesc="Perl bindings for GooCanvas2 widget using Glib::Object::Introspection"
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl-gtk3' 'goocanvas')
url='https://metacpan.org/release/GooCanvas2'
source=("https://cpan.metacpan.org/authors/id/P/PE/PERLMAX/GooCanvas2-${pkgver}.tar.gz")
sha256sums=('e24c87873e19063dd4d5e2c709caacf8c0ae8881044395bb865dc2b4fdd63b50')
options=('!emptydirs')
_distdir="GooCanvas2-${pkgver}"

build() {
  cd "${_distdir}"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor 
  make
}

package() {
  cd "${_distdir}"
  make pure_install doc_install DESTDIR="${pkgdir}"
  find "${pkgdir}" -name '.packlist' -delete
  find "${pkgdir}" -name '*.pod' -delete
}
