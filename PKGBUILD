# Maintainer: MKzero <info at linux-web-development dot de>
# Contributor: TecArt GmbH <support at tecart dot de>

pkgname='tecart-starter'
pkgver='4.6.029'
_debrel='6'
pkgrel='1'
pkgdesc='Desktop app to enable easier use of the TecArt Business Software'
arch=('x86_64')
url='http://www.tecart.de/'
license=('custom')
depends=('qt5-webkit qtkeychain')
provides=('tecart-starter')
options=(!strip)
source=("https://update.tecart.info/tecart-starter_${pkgver}-${_debrel}_amd64.deb")
md5sums=('a09d231b7108a29f2f89ee8fb36d7378')

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
