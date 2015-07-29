pkgname='perl-redmine-api'
pkgver=0.04
pkgrel=1
pkgdesc="Communicate with Redmine thought the API"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-moo' 'perl-rest-client' 'perl-json')
makedepends=()
url='http://search.cpan.org/dist/Redmine-API/'
_distdir="Redmine-API-$pkgver"
source=("http://search.cpan.org/CPAN/authors/id/C/CE/CELOGEEK/Redmine-API-$pkgver.tar.gz")
md5sums=('443a3d5bd7dd4a24fd36a2615287147e')

build() {
  cd $srcdir/Redmine-API-$pkgver
  perl Build.PL installdirs=vendor destdir="$pkgdir/"
  perl Build
}

package() {
  cd $srcdir/Redmine-API-$pkgver
  perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
