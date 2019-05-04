# Contributor: Alexander Pohl <alex at ahpohl dot com>
pkgname=perl-device-inverter-aurora
pkgver=0.05
pkgrel=1
pkgdesc='Module for communicating with Power-One Aurora inverters, containing the Device::Inverter::Aurora module'
_dist=Device-Inverter-Aurora
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-device-serialport')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/F/FR/FREMAN/$_dist-$pkgver.tar.gz")
md5sums=('e26305a788b7be148339aa60a1701b4a')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

