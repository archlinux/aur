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
sha256sums_x86_64=('c4a5ff1dbabd06be2c2d71271b0135ee44195eecd3c672b33186b6b6111ca42a')

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
  find . -type d -exec chmod 755 {} +
  chmod 755 opt/
  chmod 755 usr/
  chmod 755 usr/local
  chmod 755 usr/local/bin/
  chmod 755 usr/share/
  chmod 755 usr/share/applications/
}
