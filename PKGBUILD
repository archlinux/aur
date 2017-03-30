# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-gtk2-sexy
_cpanname=Gtk2-Sexy
pkgver=0.05
pkgrel=11
pkgdesc="Perl/CPAN Module Gtk2::Sexy"
arch=('i686' 'x86_64')
url="http://search.cpan.org/perldoc?Gtk2::Sexy"
license=('LGPL')
depends=('gtk2' 'libsexy' 'perl>=5.24' 'perl<5.25')
makedepends=('perl-extutils-pkgconfig' 'perl-extutils-depends')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/$_cpanname-$pkgver.tar.gz")
md5sums=('3e291808250d7b956ba8443013a1b461')

build() {
  cd $_cpanname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
package() {
  cd $_cpanname-$pkgver
  make DESTDIR="$pkgdir" install
}
