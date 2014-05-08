# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-xs-object-magic
_cpanname=XS-Object-Magic
pkgver=0.04
pkgrel=4
pkgdesc="Opaque, extensible XS pointer backed objects using sv_magic"
arch=('i686' 'x86_64')
url="http://metacpan.org/release/$_cpanname"
license=('Perl Artistic')
options=('!emptydirs')
makedepends=('perl-extutils-depends')
source=("http://cpan.metacpan.org/authors/id/F/FL/FLORA/${_cpanname}-${pkgver}.tar.gz")
md5sums=('ce2e38addab1c7e541ca842019cba4a4')

build() {
  cd  "$srcdir/$_cpanname-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/${_cpanname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}
