# Maintainer: Niels Martignène <niels.martignene@gmail.com>
# Contributor: moostik <mooostik_at_gmail.com>
# Contributor: pressh <pressh funnysymbol gmail dot com>
# Contributor: vantu5z <vantu5z@mail.ru>

pkgname=convertall
pkgver=0.8.0
pkgrel=1
pkgdesc="Unit conversion program (Qt)"
arch=('any')
url="http://convertall.bellz.org/"
license=('GPL')
depends=('python-pyqt5' 'desktop-file-utils')
source=("https://github.com/doug-101/ConvertAll/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'convertall.desktop')
sha256sums=('624c8a792b0bc7ff3776499c2c743b32273569efd0567615e570a7e739e8d521'
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
