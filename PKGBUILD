# Maintainer: snemc snemc @3112671039@qq.com

pkgname=umi-ocr-bin
_pkgname=${pkgname}
pkgver=2.1.4
pkgrel=1
pkgdesc="免费，开源，可批量的离线OCR软件 Free, open source, batch-capable offline OCR software, Free, open source, offline OCR software that can batch"
arch=('x86_64')
url="https://github.com/hiroi-sora/Umi-OCR"
license=('MIT')
depends=()
makedepends=(bash tar)

_srcfilename_x86_64="Umi-OCR_Linux_Paddle_${pkgver}.tar.xz"


source=("umi-ocr.desktop")
source=("${_srcfilename_x86_64}::https://github.com/hiroi-sora/Umi-OCR/releases/download/v2.1.4/Umi-OCR_Linux_Paddle_${pkgver}.tar.xz")

sha256sums=('0dae3a93eb4fc8da23097944f403d143430ec27a91ce3fa563ac5d363b69246e')


package() {
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  # install -d "${pkgdir}/opt/${_pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/docs/${_pkgname}"
  install -d "${pkgdir}/usr/share/icons"
  install -d "${pkgdir}/usr/share/mime/packages"

  install -m644 "${srcdir}/$(_pkg)/REDAME*" "${pkgdir}/usr/share/docs/${_pkgname}"
  install -m644 "${srcdir}/$(_pkg)/docs/*" "${pkgdir}/usr/share/docs/${_pkgname}"
  install -m644 "${srcdir}/$(_pkg)/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"


  install -m644 "${srcdir}/$(_pkg)/UmiOCR-data/qt_res/images/icons/umiocr.ico"  "${pkgdir}/usr/share/icons"
  

  install -m644 "${srcdir}/$(_pkg)/UmiOCR-data" "${pkgdir}/usr/share/applications"
  install -m644 "${srcdir}/$(_pkg)/umi-ocr.sh" "${pkgdir}/usr/share/applications"
  install -m644 "${srcdir}/umi-ocr.desktop" "${pkgdir}/usr/share/applications/umi-ocr.desktop"

  ln -s "${pkgdir}/usr/share/applications/umi-ocr.sh" "${pkgdir}/usr/bin/umi-ocr"
  chmod +x "${pkgdir}/usr/bin/umi-ocr"
}
