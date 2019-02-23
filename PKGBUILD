# Maintainer: ThecaTTony <thecattony at gmx dot com>
# Contributor: Santiago Bruno <bananabruno at gmail dot com>

pkgname=mtvcgui
pkgver=1.0.2
pkgrel=1
epoch=1
pkgdesc="Mencoder TV Capture GUI"
arch=('any')
url="http://www.santiagobruno.com.ar/programas.html#mtvcgui"
license=('GPL2')
depends=('hicolor-icon-theme' 'mencoder' 'mplayer' 'python2-pyqt4' 'python2-sip-pyqt4')
source=( https://github.com/sbruno/mtvcgui/archive/$pkgver.tar.gz )
md5sums=('d5ede35a483f9cdb2d85312f049f92b9')

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"/src
  install -Dm644 "${srcdir}"/"${pkgname}"/src/ui/icons/16x16/"${pkgname}".png \
		"${pkgdir}"/usr/share/icons/hicolor/16x16/apps/"${pkgname}".png
  install -Dm644 "${srcdir}"/"${pkgname}"/src/ui/icons/22x22/"${pkgname}".png \
		"${pkgdir}"/usr/share/icons/hicolor/22x22/apps/"${pkgname}".png
  install -Dm644 "${srcdir}"/"${pkgname}"/src/ui/icons/32x32/"${pkgname}".png \
		"${pkgdir}"/usr/share/icons/hicolor/32x32/apps/"${pkgname}".png
  install -Dm644 "${srcdir}"/"${pkgname}"/src/ui/icons/48x48/"${pkgname}".png \
		"${pkgdir}"/usr/share/icons/hicolor/48x48/apps/"${pkgname}".png
  install -Dm644 "${srcdir}"/"${pkgname}"/src/ui/icons/64x64/"${pkgname}".png \
		"${pkgdir}"/usr/share/icons/hicolor/64x64/apps/"${pkgname}".png
  install -Dm644 "${srcdir}"/"${pkgname}"/src/ui/icons/128x128/"${pkgname}".png \
		"${pkgdir}"/usr/share/icons/hicolor/128x128/apps/"${pkgname}".png
  install -Dm644 "${srcdir}"/"${pkgname}"/src/ui/icons/128x128/"${pkgname}".png \
		"${pkgdir}"/usr/share/pixmaps/"${pkgname}".png
  install -Dm644 "${srcdir}"/"${pkgname}"/src/ui/icons/"${pkgname}".svg \
		"${pkgdir}"/usr/share/icons/hicolor/scalable/apps/"${pkgname}".svg
  install -D "${pkgname}".desktop "${pkgdir}"/usr/share/applications/"${pkgname}".desktop
  install -d "${pkgdir}"/opt/"${pkgname}"
  cp -r * "${pkgdir}"/opt/"${pkgname}"
  install -d "${pkgdir}"/usr/bin/
  ln -s "/opt/"${pkgname}"/run.py" "${pkgdir}"/usr/bin/"${pkgname}"
}
