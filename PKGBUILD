# Maintainer: arvids  <arvids arvids net>

_perlmod=Messaging-Message
pkgname=perl-messaging-message
pkgver=1.5
pkgrel=1
pkgdesc="Set of Perl modules useful to deal with messages"
arch=('any')
url="http://search.cpan.org/dist/Messaging-Message/"
license=('PerlArtistic')
depends=('perl>=5.10.0' 'perl-no-worries' 'perl-params-validate' 'perl-json')
optdepends=()
options=('!emptydirs')
source=('http://search.cpan.org/CPAN/authors/id/L/LC/LCONS/Messaging-Message-1.5.tar.gz')
md5sums=('575616dc84421e6ffc7ae8ecc8e28d1d')

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
