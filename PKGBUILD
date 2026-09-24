# Maintainer: Kanehekili <kanehekili.media@gmail.com>
pkgname=pdfmaker
pkgver=1.0.1
pkgrel=1
pkgdesc="Join images and PDFs into a single PDF"
url="https://github.com/kanehekili/PDFMaker"
license=('GPL-2.0-or-later')
depends=('python-gobject' 'gtk3' 'imagemagick' 'ghostscript')
arch=('x86_64' 'aarch64')
source=(https://github.com/kanehekili/PDFMaker/releases/download/1.0.1/PDFMaker1.0.1.tar)
md5sums=(ad7302fe2f3bb5a5b88f40a22d433a40)

package() {
  cd "${srcdir}/PDFMaker"

  install -Dm 755 PDFMaker.py -t "${pkgdir}/opt/pdfmaker"
  install -Dm 644 *.png       -t "${pkgdir}/opt/pdfmaker"

  install -Dm 644 *.desktop -t "${pkgdir}/usr/share/applications"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/pdfmaker/PDFMaker.py" "${pkgdir}/usr/bin/pdfmaker"
}
