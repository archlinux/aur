# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=perl-gtk3-simplelist
pkgver=0.17
pkgrel=1
pkgdesc="Perl interface to the Gtk3's complex MVC list widget"
arch=('any')
license=('GPL')
depends=('perl-gtk3')
url='https://metacpan.org/pod/Gtk3::SimpleList'
source=("https://cpan.metacpan.org/authors/id/T/TV/TVIGNAUD/Gtk3-SimpleList-${pkgver}.tar.gz")
sha256sums=('ed201f74a9ff3542b7cc260159e87ca5894c24a5b182a39d6f86bb84669c9053')
options=('!emptydirs')
_distdir="Gtk3-SimpleList-${pkgver}"

build() {
  cd "${_distdir}"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor 
  make
}

package() {
  cd "${_distdir}"
  make pure_install doc_install DESTDIR="$pkgdir" 
  find "${pkgdir}" -name '.packlist' -delete
  find "${pkgdir}" -name '*.pod' -delete
}
