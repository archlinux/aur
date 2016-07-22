# Maintainer: MKzero <info at linux-web-development dot de>
# Contributor: TecArt GmbH <support at tecart dot de>

pkgname='tecart-starter'
pkgver='4.5.026'
_debrel='1'
pkgrel='1'
pkgdesc='Als kostenlose Desktop-App bietet Ihnen der TecArt-Starter viele Annehmlichkeiten gegenüber dem Aufruf im Browserfenster. Neben dem automatischen Login können Sie das TecArt-CRM auch als bevorzugten E-Mail-Client nutzen. Zudem garantiert die automatische Update-Funktion ein komfortableres Arbeiten.'
arch=('x86_64')
url='http://www.tecart.de/'
license=('custom')
depends=('qt5-webkit')
provides=('tecart-starter')
options=(!strip)
source=("https://update.tecart.info/tecart-starter_${pkgver}-${_debrel}_amd64.deb")
md5sums=('00285b5cb75afdfe8af3dad3a38f31cd')

package() {
  # Create pkgdir folders
  install -d ${pkgdir}/usr/share/${pkgname}
  install -d ${pkgdir}/usr/share/{applications,pixmaps}

  # Unpack package contents
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/

  # Fix icon cache bug
  local hicolor="${pkgdir}/usr/share/icons/hicolor"

  # Install license
  #install -m644 ${pkgdir}/opt/bitwig-studio/EULA.rtf \
  #  ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
