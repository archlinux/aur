# Maintainer: MKzero <info at linux-web-development dot de>
# Contributor: TecArt GmbH <support at tecart dot de>

pkgname='tecart-starter'
pkgver='4.6.029'
_debrel='12'
pkgrel='3'
pkgdesc='Desktop app to enable easier use of the TecArt Business Software'
arch=('x86_64')
url='http://www.tecart.de/'
license=('custom')
depends=('qt5-webkit' 'qtkeychain')
provides=('tecart-starter')
options=(!strip)
source=("https://repo.tecart.de/apt/ubuntu/pool/main/t/tecart-starter/tecart-starter_${pkgver}-${_debrel}_amd64.deb")
md5sums=('b674568af141e98f91d6cf441c7f889b')

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
