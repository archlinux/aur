# Maintainer: MKzero <info at linux-web-development dot de>
# Contributor: TecArt GmbH <support at tecart dot de>

pkgname='tecart-starter'
pkgver='4.6.030'
_debrel='43'
pkgrel='1'
pkgdesc='Desktop app to enable easier use of the TecArt Business Software'
arch=('x86_64')
url='http://www.tecart.de/'
license=('custom')
depends=('qt5-webkit' 'qtkeychain')
provides=('tecart-starter')
options=(!strip)
source=("https://repo.tecart.de/apt/ubuntu/pool/main/t/tecart-starter/tecart-starter_${pkgver}-${_debrel}_amd64.deb")
md5sums=('5a4333ee44fdb0d0a586611a84a564e8')

package() {
  # Create pkgdir folders
  install -d ${pkgdir}/usr/share/${pkgname}
  install -d ${pkgdir}/usr/share/{applications,pixmaps}

  # Unpack package contents
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/

  # Fix icon cache bug
  local hicolor="${pkgdir}/usr/share/icons/hicolor"
}
