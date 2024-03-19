# Contributor: vantu5z <vantu5z@mail.ru>

pkgname=convertall-py
pkgver=0.8.0
pkgrel=2
pkgdesc="Unit conversion program (Qt). Python version."
arch=('any')
url="http://convertall.bellz.org/"
license=('GPL')
depends=('python-pyqt5' 'desktop-file-utils')
conflicts=('convertall' 'convertall-git')
source=("https://github.com/doug-101/ConvertAll-py/releases/download/v${pkgver}/convertall-${pkgver}.tar.gz"
        'convertall.desktop')
sha256sums=('624c8a792b0bc7ff3776499c2c743b32273569efd0567615e570a7e739e8d521'
            'de48914e795340481c14e00c4a1d58d22f717fc6ec171edb6bf855488c92d9a4')

package() {
  cd ConvertAll

  python install.py -b "${pkgdir}" -p /usr -i "/usr/share/pixmaps/convertall"
  rm "${pkgdir}/usr/share/doc/convertall"/{INSTALL,LICENSE}

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
