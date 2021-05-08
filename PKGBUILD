# Maintainer : Nicolas Guillaumin <nicolas plus archlinux at guillaumin dot me>
_perlmod=Device-USB-PCSensor-HidTEMPer
_modnamespace=Device
pkgname=perl-device-usb-pcsensor-hidtemper
pkgver=0.04
pkgrel=1
pkgdesc="Perl interface to PCSensor USB thermometers"
arch=(i686 x86_64 armv7h)
url="https://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-device-usb')
options=('!emptydirs')
source=("https://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=(a0adcbdc3f365ade57ac37a787177ca4efd551e01d4f2728aa9809aaf8f50711)

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
