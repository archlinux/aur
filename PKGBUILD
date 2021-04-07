# Contributor: pbnoxious <pbnoxious (at) web (dot) de>

pkgname=texlive-revtex
pkgver=4.2e
pkgrel=1
pkgdesc="REVTeX package used by the American Physical Society, American Institute of Physics, and Optical Society of America"
arch=('any')
url='https://journals.aps.org/revtex'
license=('custom')
depends=('texlive-bin')
source=('http://mirrors.ctan.org/install/macros/latex/contrib/revtex.tds.zip'
        'https://www.latex-project.org/lppl/lppl-1-3c.txt')
md5sums=('0427e76dace754ed568968c5ff689909'
         '9f4337828d782bdea41f03dd2ad1b808')

package() {
  install -Dm644 "${srcdir}/lppl-1-3c.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p -- "${pkgdir}/usr/share/texmf/"
  cd -- "${pkgdir}/usr/share/texmf/"
  bsdtar -xf "${srcdir}/revtex.tds.zip"
  find "${pkgdir}" -type f -exec chmod 644 '{}' \+
  find "${pkgdir}" -type d -exec chmod 755 '{}' \+
}
