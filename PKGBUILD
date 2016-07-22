# Contributor: TDY <tdy@gmx.com>
# Maintainer: RubenKelevra <ruben@vfn-nrw.de>

pkgname=perl-class-container
pkgver=0.12
pkgrel=1
pkgdesc="A Perl module that glues object frameworks together transparently"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Class-Container/"
license=('GPL' 'PerlArtistic')
depends=('perl-carp-clan' 'perl-params-validate')
source=(http://search.cpan.org/CPAN/authors/id/K/KW/KWILLIAMS/Class-Container-$pkgver.tar.gz)
md5sums=('6896bdb4464b96ad638e22b0400acbc9')

build() {
  cd "$srcdir/Class-Container-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
}

package() {
  cd "$srcdir/Class-Container-$pkgver"
  make DESTDIR="$pkgdir" install
}
