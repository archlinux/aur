# Mantainer: 3ED <krzysztof1987 at gmail dot com>
#

pkgname=perl-gtk2-ex-mplayerembed
_lastauthor=G/GB/GBROWN
_pkgname=Gtk2-Ex-MPlayerEmbed
pkgver=0.02
pkgrel=3
pkgdesc="a widget to embed the MPlayer media player into GTK+ applications"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('gtk2-perl' 'mplayer')
makedepends=('perl-extutils-makemaker')
url="http://search.cpan.org/dist/${_pkgname}/"
source=(http://search.cpan.org/CPAN/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('bf6459def11b0ad221a896a238a81dd6b60d688ad30c7cc4ec7b7265dd9221a2')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/${_pkgname}-${pkgver}"
  perl Makefile.PL
  make
}
check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make test
}
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make install
}

