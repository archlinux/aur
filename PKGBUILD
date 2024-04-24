# Maintainer: Bartłomiej Szostak <kapcioszek2137@gmail.com>
# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=docx2tex
pkgver=1.9
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
sha256sums=('6369b5c3fb19b867b3083bb88ccff2c08bebb6c4aed18e7f5facb75e4ff1683e')

package() {
  install -d "${pkgdir}/opt"
  install -d "${pkgdir}/usr/bin/"
  ln -sf /opt/docx2tex/d2t "${pkgdir}/usr/bin/"
  unzip ${pkgname}-${pkgver}.zip -d "${pkgdir}/opt"
  chmod 007 "${pkgdir}/opt/docx2tex/xproc-util/simple-progress-msg/xpl/status/"
  install -Dm644 "${pkgdir}/opt/docx2tex/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
