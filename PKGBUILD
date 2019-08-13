# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: TDY <tdy@gmx.com>

pkgname=perl-text-autoformat
_cpanname=Text-Autoformat
pkgver=1.75
pkgrel=1
pkgdesc="A Perl module for automatic text wrapping and reformatting"
arch=('any')
url="https://metacpan.org/pod/Text::Autoformat"
license=('GPL' 'PerlArtistic')
depends=('perl-text-reform')
options=('!emptydirs')
source=(https://cpan.metacpan.org/authors/id/N/NE/NEILB/${_cpanname}-${pkgver}.tar.gz)
md5sums=('b363538a55eb1315951cbe022124684b')

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
