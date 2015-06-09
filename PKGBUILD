# Maintainer : Nicolas Guillaumin <nicolas plus archlinux at guillaumin dot me>
_perlmod=Device-USB-PCSensor-HidTEMPer
_modnamespace=Device
pkgname=perl-device-usb-pcsensor-hidtemper
pkgver=0.04
pkgrel=1
pkgdesc="Perl interface to PCSensor USB thermometers"
arch=(i686 x86_64 armv7h)
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-device-usb')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
md5sums=(b778565303df4a28c6a727a324c41e0b)

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
