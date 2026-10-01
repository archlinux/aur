# Maintainer: robertfoster

pkgname=perl-file-grep
_realname=File-Grep
pkgver=0.02 # renovate: datasource=cpan depName=File::Grep
pkgrel=1
pkgdesc="Find matches to a pattern in a series of files and related functions"
arch=(any)
url="https://metacpan.org/release/$_realname"
license=('GPL-1.0-or-later' 'Artistic-1.0-Perl')
depends=(perl)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/M/MN/MNEYLON/$_realname-$pkgver.tar.gz")
sha256sums=('462e15274eb6278521407ea302d9eea7252cd44cab2382871f7de833d5f85632')

build() {
  cd "$_realname-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$_realname-$pkgver"
  make DESTDIR="$pkgdir" install
}
