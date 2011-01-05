# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgname=gtk2-perl
_realname=Gtk2
pkgver=1.222
pkgrel=2
pkgdesc="Gtk2-Perl allows Perl developers to write GTK+ 2.x applications."
arch=(i686 x86_64)
license=('LGPL')
url="http://gtk2-perl.sourceforge.net/"
makedepends=('perl-extutils-pkgconfig' 'perl-extutils-depends')
depends=('gtk2' 'pango-perl')
options=('!emptydirs')
source=(http://downloads.sourceforge.net/sourceforge/gtk2-perl/${_realname}-${pkgver}.tar.gz)
md5sums=('8f8a170b33dc2cf4e69769e97c05185a')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
  make install DESTDIR="${pkgdir}"
}
