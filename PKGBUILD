# Maintainer: MaoYaoTang <maoyaotang@163.com>

pkgname=android-signapk-gui
pkgver=1.0.0
pkgrel=1
pkgdesc="简单APK&刷机包图形签名工具"
arch=('any')
license=('LGPL2.1')
url="https://github.com/maoyaotang12/android-signapk-gui"
depends=(
  'android-signapk'
  'python'
  'python-pyqt6'
)

source=(git+$url.git)

sha256sums=('SKIP')

package() {
  install -Dm755 "${srcdir}/${pkgname}/signapk-gui.py" "${pkgdir}/usr/bin/signapk-gui"

  install -Dm644 "${srcdir}/${pkgname}/signapk-gui.desktop" "${pkgdir}/usr/share/applications/signapk-gui.desktop"
  install -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  install -m644 "${srcdir}/${pkgname}/signapk.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/signapk.svg"

  # 许可证
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
