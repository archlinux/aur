# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-gtk2-traymanager
_cpanname=Gtk2-TrayManager
pkgver=0.05
pkgrel=1
pkgdesc="CPAN/Gtk2::TrayManger -- perl bindings for EggTrayManager"
arch=(x86_64 i686)
url="https://metacpan.org/module/Gtk2::TrayManager"
license=('GPL')
depends=('gtk2-perl')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/B/BO/BORUP/$_cpanname-$pkgver.tar.gz")
md5sums=('88cf41ab0d72572ac3d2e9ab9b3ab8f0')

build() {
  cd "$srcdir/$_cpanname-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$_cpanname-$pkgver"
  make DESTDIR="$pkgdir" install
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
