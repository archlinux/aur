# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=kde-servicemenus-pdf
pkgver=0.6
pkgrel=4
pkgdesc="A KDE service menus for PDF documents from dolphin"
arch=('any')
url="http://www.egregorion.net"
license=('GPL')
depends=('dolphin' 'kdebase-kdialog' 'ghostscript' 'texlive-bin' 'poppler' 'pdftk')
source=(http://www.egregorion.net/works/kde/servicemenus/pdf/kde-service-menu-pdf_0.6archlinux.tar.gz)
md5sums=('26e9f8d37d40a49250d3b84905f88ae5')

package() {
  mkdir -p ${pkgdir}/usr/share/kservices5/ServiceMenus/
  mkdir -p ${pkgdir}/usr/bin/
  install -m 644 ${srcdir}/kde-service-menu-pdf_${pkgver}archlinux/desktop/*.desktop ${pkgdir}/usr/share/kservices5/ServiceMenus/
  install -m 755 ${srcdir}/kde-service-menu-pdf_${pkgver}archlinux/bin/* ${pkgdir}/usr/bin/
  sed -i 's_#!/usr/bin/python_#!/usr/bin/python2_' ${pkgdir}/usr/bin/pydftk
}
