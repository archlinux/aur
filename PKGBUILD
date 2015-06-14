# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: TDY <tdy@gmx.com>

pkgname=perl-text-autoformat
_cpanname=Text-Autoformat
pkgver=1.72
pkgrel=1
pkgdesc="A Perl module for automatic text wrapping and reformatting"
arch=('any')
url="https://metacpan.org/pod/Text::Autoformat"
license=('GPL' 'PerlArtistic')
depends=('perl-text-reform')
options=('!emptydirs')
source=(https://cpan.metacpan.org/authors/id/N/NE/NEILB/${_cpanname}-${pkgver}.tar.gz)
md5sums=('ebb9d3b1c74776870d65d2b66046876e')

build() {
  cd "$srcdir/${_cpanname}-${pkgver}"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/${_cpanname}-${pkgver}"
  make install DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:
