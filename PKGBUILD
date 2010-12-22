# Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname=perl-config-properties
pkgver=1.71
pkgrel=1
pkgdesc="Config::Properties is a near implementation of the java.util.Properties API."
arch=(any)
url="http://search.cpan.org/~salva/Config-Properties/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/S/SA/SALVA/Config-Properties-$pkgver.tar.gz)
md5sums=(b8b8457f3b07f5e4b342353fed43f93b)

build() {
  cd "$srcdir/Config-Properties-$pkgver"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
  
}

package() {
  cd "$srcdir/Config-Properties-$pkgver"
  make install DESTDIR="$pkgdir/"

}

# vim:set ts=2 sw=2 et:
