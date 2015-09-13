# Maintainer: Keith Henderson Jr <keithhendersonjr@gmail.com>
# Contributer: Robert Mackanics <schnoopay@gmx.com>

pkgname="libreoffice-still-en-us-help"
pkgver=4.4.5
pkgrel=1
pkgdesc="en-US offline help for Libreoffice Still"
arch=('any')
url="http://www.documentfoundation.org"
license=('LGPL')
makedepends=('binutils' 'tar')
conflicts=('libreoffice-en-us-help')
source=("http://download.documentfoundation.org/libreoffice/stable/${pkgver}/deb/x86/LibreOffice_${pkgver}_Linux_x86_deb_helppack_en-US.tar.gz")
prepare() {
  tar -xf ${srcdir}/LibreOffice_$pkgver*_Linux_x86_deb_helppack_en-US.tar.gz
  ar x ${srcdir}/LibreOffice_4.4.5.2_Linux_x86_deb_helppack_en-US/DEBS/libobasis4.4-en-us-help_4.4.5.2-2_i386.deb
  tar -xf data.tar.gz
}

package() {
  mkdir -p "$pkgdir"/usr/lib/libreoffice/
  cp -R opt/libreoffice*/* "$pkgdir"/usr/lib/libreoffice

}
md5sums=('e55f363217fd552d4e8b4829a0595d03')
