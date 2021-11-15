# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_author=URI
_perlmod=Template-Simple
pkgname=perl-template-simple
pkgver=0.06
pkgrel=1
pkgdesc="A simple and very fast template module"
arch=('any')
url="https://metacpan.org/release/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=(
  'perl>=5.10.0'
  'perl-file-slurp'
  )
options=(!emptydirs)
source=(https://cpan.metacpan.org/authors/id/${_author:0:1}/${_author:0:2}/$_author/$_perlmod-$pkgver.tar.gz)
md5sums=('d7ae8a05666b68d5b00cb4da7f25c774')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make

}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"

}

# vim:set ts=2 sw=2 et:
