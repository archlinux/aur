# Maintainer: Niels Martignène <niels.martignene@gmail.com>
# Contributor: moostik <mooostik_at_gmail.com>
# Contributor: pressh <pressh funnysymbol gmail dot com>

pkgname=convertall
pkgver=0.7.5
pkgrel=1
pkgdesc="Unit conversion program (Qt)"
arch=('any')
url="http://convertall.bellz.org/"
license=('GPL')
depends=('python-pyqt5' 'desktop-file-utils')
source=("http://download.sourceforge.net/project/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz" 
        'convertall.desktop')
sha256sums=('97944dba0d5a2cc023fada8120b4712272e2a9fc535d92210dd7e01acf413565'
            '4f7ac9402580e866b360e07e07bfe1d05311f64f996dcf647094db6de9455212')

package() {
  cd ConvertAll

  python install.py -b "${pkgdir}" -p /usr -i /usr/share/pixmaps/convertall
  rm "${pkgdir}/usr/share/doc/${pkgname}"/{INSTALL,LICENSE}

  install -Dm644 icons/convertall-icon.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/convertall.svg"
  install -Dm644 icons/convertall_lg.png \
    "${pkgdir}/usr/share/icons/hicolor/64x64/apps/convertall.png"
  install -Dm644 icons/convertall_med.png \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/convertall.png"
  install -Dm644 icons/convertall_sm.png \
    "${pkgdir}/usr/share/icons/hicolor/16x16/apps/convertall.png"

  install -Dm644 "${srcdir}/convertall.desktop" \
    "${pkgdir}/usr/share/applications/convertall.desktop"
}
