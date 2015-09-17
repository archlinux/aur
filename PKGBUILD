# Maintainer: Danilo Bargen <mail at dbrgn dot ch>
pkgname=ocr-fonts
pkgver=0.2
pkgrel=1
pkgdesc="Free versions of OCR-friendly sans-serif monospace TTF/OTF fonts (OCR-A and OCR-B) described in 'ISO 1073-1' and 'ISO 1073-2' standards."
arch=('any')
license=('other')
url="http://ansuz.sooke.bc.ca/page/fonts#ocrb"
source=("http://jaist.dl.sourceforge.jp/tsukurimashou/56948/ocr-0.2.zip"
        "install")
install=install
sha256sums=('39289c641520265ecedbade99f01600f316f8196ec57f71c8402d3ba09438666'
            '54113221c6134d94646647aa06931d73ff9f5bc5bb915f98f0fa7d70ca9bb31d')

package() {
  mkdir -p ${pkgdir}/usr/share/fonts/{TTF,OTF}/ || return 1
  install -m 644 -o root ${srcdir}/ocr-${pkgver}/OCR*.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -m 644 -o root ${srcdir}/ocr-${pkgver}/OCR*.otf ${pkgdir}/usr/share/fonts/OTF/
}
