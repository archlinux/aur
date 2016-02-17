# Maintainer: Chris Kitching <chriskitching@linux.com>
# Essentially stolen from Nathan Hulse <nat.hulse@gmail.com>
# Oddly it disappeared from the AUR, and I want creduce, so I dug it
# up and mopped the blood off.

pkgname=perl-sys-cpu
pkgver=0.61
pkgrel=1
pkgdesc="Perl extension for getting CPU information. Currently only number of CPU's supported."
arch=('any')
url="http://search.cpan.org/~mkoderer/Sys-CPU-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(https://cpan.metacpan.org/authors/id/M/MZ/MZSANFORD/Sys-CPU-$pkgver.tar.gz)
md5sums=(f43a3a50ac2dca6c1485a859ebef09b2)

build() {
  cd "$srcdir/Sys-CPU-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/Sys-CPU-$pkgver"
  make install DESTDIR="$pkgdir/"
}

