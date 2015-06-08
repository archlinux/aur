# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Sven Salzwedel <sven_salzwedel@web.de>
# Contributor: Olaf Leidinger <leidola@newcon.de>

pkgname=perl-pdf-api2
pkgver=2.023
pkgrel=1
pkgdesc="A module chain to faciliate the creation and modification of high-quality PDF files"
arch=('any')
url="http://search.cpan.org/dist/PDF-API2/"
license=('LGPL')
depends=('perl-font-ttf')
options=('!emptydirs')
source=("PDF-API2-$pkgver.tar.gz::http://cpan.metacpan.org/authors/id/S/SS/SSIMMS/PDF-API2-$pkgver.tar.gz")
sha256sums=('e3999b817b6db4757bcbe4c31040787c2b93228f0e952d64c142288c8ec40481')

build() {
  cd "$srcdir/PDF-API2-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/PDF-API2-$pkgver"
  make install DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:
