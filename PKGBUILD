# Maintainer: whriedplanck

pkgname=astap-bin
_pkgname=astap
pkgver=0.9.382
pkgrel=1
pkgdesc="Astrometric (plate) solver, stacking of images, photometry and FITS viewer"
arch=('i686' 'x86_64')
url="http://www.hnsky.org/astap.htm"
license=('GPL')
depends=('desktop-file-utils' 'libxrender' 'shared-mime-info' 'libxext' 'gtk2')
source_i686=("https://master.dl.sourceforge.net/project/astap-program/linux_installer/${_pkgname}_i386.deb")
source_x86_64=("https://master.dl.sourceforge.net/project/astap-program/linux_installer/${_pkgname}_amd64.deb")
sha256sums_i686=('2fc7e6d8c8c19ea376b756d70b19439b63ded0e6af97e4fef490c169f1a0f396')
sha256sums_x86_64=('5e4ecdeeab1501b7ae6db9bdd8e32760eb605c22655ce40bded793c4c528112c')

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
