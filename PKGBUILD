# $Id$
# Maintainer: Sergej Pupykin <pupykin.s+arch at gmail.com>
# Maintainer: Tom K <tomk at runbox.com>
# Maintainer: Robin Becker <robin at reportlab.com>

pkgname=perl-gtk2-trayicon
pkgver=0.07
pkgrel=1
pkgdesc="Perl interface to the EggTrayIcon library"
arch=('i686' 'x86_64' 'aarch64')
url="http://search.cpan.org/dist/Gtk2-TrayIcon/"
depends=('gtk2-perl')
makedepends=('perl-extutils-pkgconfig' 'perl-extutils-depends')
license=("GPL")
options=('!emptydirs')
source=("http://downloads.sourceforge.net/sourceforge/gtk2-perl/Gtk2-TrayIcon-${pkgver}.tar.gz")
md5sums=('c3db5edd7c39ca52625d664b0fb988a5')

build() {
  cd  Gtk2-TrayIcon-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd  Gtk2-TrayIcon-${pkgver}
  make install DESTDIR=${pkgdir}
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name '*.pod' -delete
}
