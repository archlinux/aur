# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=docx2tex
pkgver=1.5
pkgrel=1
pkgdesc="Converts Microsoft Word docx to LaTeX"
arch=('any')
url='https://github.com/transpect/docx2tex'
license=('BSD')
install='docx2tex.install'
depends=('java-runtime>=7'
         'ruby'
         'bash')
makedepends=('unzip')
noextract=("${pkgname}-${pkgver}.zip")
source=("${pkgname}-${pkgver}.zip::https://github.com/transpect/docx2tex/releases/download/v.${pkgver}/docx2tex-${pkgver}-release.zip")
sha256sums=('0b152f808b52a23b7f21044c9ce819fc03783cb60c089c5e8700fca965d8528b')

package() {
  install -d "${pkgdir}/opt"
  install -d "${pkgdir}/usr/bin/"
  ln -sf /opt/docx2tex/d2t "${pkgdir}/usr/bin/"
  unzip ${pkgname}-${pkgver}.zip -d "${pkgdir}/opt"
  chmod 007 "${pkgdir}/opt/docx2tex/xproc-util/simple-progress-msg/xpl/status/"
  install -Dm644 "${pkgdir}/opt/docx2tex/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}