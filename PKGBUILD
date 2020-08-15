# Maintainer: whriedplanck

pkgname=astap-bin
_pkgname=astap
pkgver=0.9.402
pkgrel=1
pkgdesc="Astrometric (plate) solver, stacking of images, photometry and FITS viewer"
arch=('i686' 'x86_64')
url="http://www.hnsky.org/astap.htm"
license=('GPL')
depends=('desktop-file-utils' 'libxrender' 'shared-mime-info' 'libxext' 'gtk2')
source_i686=("${_pkgname}_i386.deb::https://sourceforge.net/projects/astap-program/files/linux_installer/astap_i386.deb/download")
source_x86_64=("${_pkgname}_amd64.deb::https://sourceforge.net/projects/astap-program/files/linux_installer/astap_amd64.deb/download")
sha256sums_i686=('2fc7e6d8c8c19ea376b756d70b19439b63ded0e6af97e4fef490c169f1a0f396')
sha256sums_x86_64=('681e1c3c3aa1b14cacf2f411075b1505759185df36f20e657317341b2667b2d7')

build() {
  if [[ "$CARCH" == "i686" ]]; then
    ar x "${_pkgname}_i386.deb"
  else
    ar x "${_pkgname}_amd64.deb"
  fi
}

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir"
  cd "${pkgdir}"
  chmod 755 opt/
  chmod 755 usr/
  chmod 755 usr/local
  chmod 755 usr/local/bin/
  chmod 755 usr/share/
  chmod 755 usr/share/applications/
}
