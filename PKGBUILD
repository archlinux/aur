# Maintainer: Musikolo <musikoloAThotmailDOTcom> 

pkgname=xmms-skins-huge
pkgver=1.0.0
pkgrel=3
pkgdesc="Over 680 home-made skin collection for XMMS"
url="http://xmms.org/skins.php"
license=("GPL")
depends=('xmms' 'unzip')
arch=('any')
source=(http://webs.ono.com/supercarlos/$pkgname-src-$pkgver.tar.gz)
sha256sums=('954e874a9bc712297508273998eec47aed113ca9c3fb1c0a83f682ba05da71e4')

package() {
  _SKINS_DIR="/Skins"|| return 1
  _INSTALL_DIR="${pkgdir}`xmms-config --data-dir`${_SKINS_DIR}" || return 1
  cd ${srcdir}${_SKINS_DIR}
  install -d ${_INSTALL_DIR} || return 1
  install *  ${_INSTALL_DIR} || return 1
}
