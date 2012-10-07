# Contributor: Christian Sturm <reezer@reezer.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Francois Charette <firmicus@gmx.net>

pkgname=perl-alien-wxwidgets
_pkgname=Alien-wxWidgets
pkgver=0.62
pkgrel=1
pkgdesc="Building, finding and using wxWidgets binaries"
arch=('any')
url="https://metacpan.org/release/Alien-wxWidgets"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=(http://cpan.metacpan.org/authors/id/M/MD/MDOOTSON/${_pkgname}-$pkgver.tar.gz)
md5sums=('a26e3636aeb6c550935a36711ce13e9c')

build() {
  cd $srcdir/${_pkgname}-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  find $pkgdir -name perllocal.pod -delete
  find $pkgdir -name .packlist -delete
}
