# Contributor: Christian Sturm <reezer@reezer.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Francois Charette <firmicus@gmx.net>

pkgname=perl-alien-wxwidgets
_pkgname=Alien-wxWidgets
pkgver=0.59
pkgrel=1
pkgdesc="Building, finding and using wxWidgets binaries"
arch=('any')
url="https://metacpan.org/release/Alien-wxWidgets"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=(http://cpan.metacpan.org/authors/id/M/MD/MDOOTSON/${_pkgname}-$pkgver.tar.gz)
md5sums=('b4a221625a895aa40b3aaf1625186f7f')

build() {
  cd $srcdir/${_pkgname}-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  find $pkgdir -name perllocal.pod -delete
  find $pkgdir -name .packlist -delete
}
