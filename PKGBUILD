# Contributor: Johannes Dewender arch at JonnyJD dot net
pkgname=perl-file-fcntllock
_perlmod=File-FcntlLock
pkgver=0.20
pkgrel=1
pkgdesc="Perl module for file locking with fcntl(2)"
arch=('any')
url="http://search.cpan.org/dist/$_perlmod/"
license=('GPL' 'PerlArtistic')
groups=()
depends=('perl>=5.10.0')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://search.cpan.org/CPAN/authors/id/J/JT/JTT/$_perlmod-$pkgver.tar.gz)
sha256sums=('3870e6fe47d1cea4de063af10676593dcd8b91aecf95fc94b64edd657f9a9e10')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_perlmod-$pkgver"
  make test
}
package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
