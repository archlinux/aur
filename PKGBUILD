# Maintainer: Jonathan Liu <net147@gmail.com>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: K. Piche <kpiche@rogers.com>

pkgname=swatch
pkgver=3.2.3
pkgrel=1
pkgdesc="The active log file monitoring tool"
arch=('any')
license=('GPL')
url="http://swatch.sourceforge.net/"
depends=('perl-date-calc' 'perl-date-manip' 'perl-file-tail' 'perl-timedate' 'perl>=5.10.0')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz")
options=('!emptydirs')
md5sums=('1162f1024cf07fc750ed4960d61ac4e8')

build() {
  cd "${pkgname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

