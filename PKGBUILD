# Maintainer: XavierCLL <xavier.corredor.llano@gmail.com>

pkgname=kf5-servicemenus-pdf
pkgver=2.3
pkgrel=4
pkgdesc="A KDE service menus for PDF documents from dolphin"
arch=('any')
url="http://www.egregorion.net"
license=('GPL-3.0-or-later')
depends=('dolphin' 'kdialog' 'ghostscript' 'texlive-bin' 'poppler' 'pdftk' 'texlive-binextra' 'texlive-latexrecommended')
source=("http://www.egregorion.net/works/kde/servicemenus/pdf/kde-service-menu-pdf_${pkgver}_all.tar.gz")
sha256sums=('52a0241c2841e33cab38ef3bcfacac71dce9658256c6301bb6859f6da76e7555')

package() {
  cd "kde-service-menu-pdf_${pkgver}_all"
  # fix pdfbook2 bin
  sed -i 's/which pdfbook/which pdfbook2/g' bin/pdfbook-kdialog
  
  install -dm 755 "${pkgdir}/usr/share/kservices5/ServiceMenus/"
  install -m 644 ServiceMenus/*.desktop "${pkgdir}/usr/share/kservices5/ServiceMenus/"
  
  install -dm 755 "${pkgdir}/usr/bin/"
  install -m 755 bin/* "${pkgdir}/usr/bin/"
}

