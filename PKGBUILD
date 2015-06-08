# Maintainer: Jonne Haß <me@mrzyx.de>
_author="jgoldberg"
_perlmod="Text-Levenshtein"
pkgname=perl-text-levenshtein
pkgver=0.05
pkgrel=1
pkgdesc="Text::Levenshtein - An implementation of the Levenshtein edit distance"
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('unknown')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://cpan.perl.org/modules/by-authors/id/J/JG/JGOLDBERG/$_perlmod-$pkgver.tar.gz)
md5sums=('481bf8c903db6ba7e5c9251140e1b98f')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
