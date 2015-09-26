# Maintainer: Keith Henderson Jr <keithhendersonjr@gmail.com>
# Contributer: Robert Mackanics <schnoopay@gmx.com>

pkgname="libreoffice-fresh-en-us-help"
pkgver=5.0.2
pkgrel=2
pkgdesc="en-US offline help for Libreoffice Fresh"
arch=('any')
url="http://www.documentfoundation.org"
license=('LGPL')
makedepends=('binutils' 'tar')
conflicts=('libreoffice-en-us-help')
source=("http://download.documentfoundation.org/libreoffice/stable/${pkgver}/deb/x86/LibreOffice_${pkgver}_Linux_x86_deb_helppack_en-US.tar.gz")
prepare() {
  tar -xf ${srcdir}/LibreOffice_$pkgver*_Linux_x86_deb_helppack_en-US.tar.gz
  ar x ${srcdir}/LibreOffice_5.0.2.2_Linux_x86_deb_helppack_en-US/DEBS/libobasis5.0-en-us-help_5.0.2.2-2_i386.deb
  tar -xf data.tar.gz
}

package() {
  mkdir -p "$pkgdir"/usr/lib/libreoffice/
  cp -R opt/libreoffice*/* "$pkgdir"/usr/lib/libreoffice

}
md5sums=('58023a77947dba0353cee59dd7c710a4')
