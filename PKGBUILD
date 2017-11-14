#Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=perl-hash-storediterator
pkgver=0.008
pkgrel=2
pkgdesc='Access to iterator inside Perl hashes, plus helper functions'
_dist=Hash-StoredIterator
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl')
makedepends=('perl-module-build')
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/M/MS/MSCHWERN/$_dist-$pkgver.tar.gz")

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL
  ./Build
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs=vendor --destdir="$pkgdir"
}

sha1sums=('607474f86ba7879825abb787809671217d4598b5')
sha256sums=('b9cbc4dcd8233e8d1d7f1481ddb79a4a5f9db7180cb3ef02b4bcbee05e65ea0c')
