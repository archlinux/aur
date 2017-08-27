# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: Peter Richard Lewis <plewis@aur.archlinux.org>
# Contributor: Giorgio Lando <patroclo7 at gmail dot com>

pkgname=perl-term-readline-ttytter
_pkgname=Term-ReadLine-TTYtter
pkgver=1.4
pkgrel=4
pkgdesc="A Perl readline for the oysttyer twitter client"
arch=(any)
url="http://search.cpan.org/dist/Term-ReadLine-TTYtter"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-term-readkey')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/C/CK/CKAISER/$_pkgname-$pkgver.tar.gz)
sha256sums=('ac373133cee1b2122a8273fe7b4244613d0eecefe88b668bd98fe71d1ec4ac93')

build() {
  cd "$_pkgname-$pkgver"
  exporL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$_pkgname-$pkgver"
  #make install
  make install DESTDIR="${pkgdir}"

 # remove perllocal.pod and .packlist
 find "${pkgdir}" -name perllocal.pod -delete
 find "${pkgdir}" -name .packlist -delete
}
