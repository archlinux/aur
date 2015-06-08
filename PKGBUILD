# Maintainer: Your Name <youremail@domain.com>
pkgname=pip
pkgver=1.2
pkgrel=1
pkgdesc="Wraps programs to use them as filters."
arch=('any')
url="http://membled.com/work/apps/pip/"
license=('GPL')
groups=()
depends=('perl>=5.10.0')
makedepends=()
provides=()
conflicts=('python-pip') # this package has a very unfortunate name...
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://membled.com/work/apps/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('25b9a9dc0d659bfabf6a528bb27ec8e6')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
