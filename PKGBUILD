# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: TDY <tdy@archlinux.info>

pkgname=perl-text-autoformat
_perlname=Text-Autoformat
pkgver=1.71
pkgrel=1
pkgdesc="A Perl module for automatic text wrapping and reformatting"
arch=('any')
url="http://search.cpan.org/dist/Text-Autoformat/"
license=('GPL' 'PerlArtistic')
depends=('perl-text-reform')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/N/NE/NEILB/${_perlname}-${pkgver}.tar.gz")
sha256sums=('80ea45fcadfb6f4846d01e67db7800a4a2e2bdca2dfc9cf04859d98cda3db42d')

build() {
  cd "$srcdir/${_perlname}-${pkgver}"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/${_perlname}-${pkgver}"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# vim:set ts=2 sw=2 et:
