# Maintainer: Jah Way <jahway603 at protonmail dot com>
# Previous Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com
# Contributor: Charles Mauch <cmauch@gmail.com>

pkgname=perl-file-monitor
_realname=File-Monitor
pkgver=1.00
pkgrel=1
pkgdesc="Portable implementation of file-mon"
arch=(any)
url="http://search.cpan.org/~andya/File-Monitor-1.00/lib/File/Monitor.pm"
license=(GPL Artistic-1.0-Perl)
depends=(perl)
options=('!emptydirs')
_author=PLICEASE
source=("http://search.cpan.org/CPAN/authors/id/A/AN/ANDYA/File-Monitor-1.00.tar.gz")
sha512sums=('86d38c4664c1ebdbc40c01f1837697cf6a8e7b58c3bb3b5ee731fc2e1340f0150d842990bea8bd8baa19dfa87db7912ba929f494a38ec5f8c546d1883eeb9628')

build() {
  cd "$srcdir/${_realname}-${pkgver}"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/${_realname}-${pkgver}"
  make install DESTDIR="$pkgdir"
}
