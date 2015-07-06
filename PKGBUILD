# Maintainer: masutu <masutu dot arch at googlemail dot com>
# Contributor: masutu <masutu dot arch at googlemail dot com>
pkgname=perl-audio-jackminimix
pkgver=0.02
pkgrel=1
pkgdesc="Talk to JACK Mini Mixer (jackminimix) using OSC"
arch=('any')
url="http://search.cpan.org/~njh/Audio-JackMiniMix-0.02/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-net-liblo')
options=(!emptydirs)
source=('http://search.cpan.org/CPAN/authors/id/N/NJ/NJH/Audio-JackMiniMix-0.02.tar.gz')
md5sums=('5be760caf3037d663861548977b4b236')

build() {
  cd "$srcdir/Audio-JackMiniMix-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/Audio-JackMiniMix-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
