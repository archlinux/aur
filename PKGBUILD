# Maintainer: whriedplanck

pkgname=astap-bin
_pkgname=astap
pkgver=0.9.375
pkgrel=1
pkgdesc=" astrometric (plate) solver, stacking of images, photometry and FITS viewer"
arch=('i686' 'x86_64')
url="http://www.hnsky.org/astap.htm"
license=('GPL')
depends=('desktop-file-utils' 'libxrender' 'shared-mime-info' 'libxext' 'gtk2')
source_i686=("https://svwh.dl.sourceforge.net/project/astap-program/linux_installer/${_pkgname}_i386.deb")
source_x86_64=("https://ayera.dl.sourceforge.net/project/astap-program/linux_installer/${_pkgname}_amd64.deb")
sha256sums_i686=('cdd88a5f18cd9183e0f1de1aa438f7150b76cb7e7ba2940f2fd237bff6be43bb')
sha256sums_x86_64=('8f4090f225c09c4c01f3de49ca9f61b5dca248701f20be3e4508ecdc43e41876')

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
