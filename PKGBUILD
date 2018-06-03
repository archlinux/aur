# Maintainer: Musikolo <musikoloAThotmailDOTcom> 

pkgname=xmms-skins-huge
pkgver=1.0.0
pkgrel=4
pkgdesc="Over 680 home-made skin collection for XMMS"
url="http://xmms.org/skins.php"
license=("GPL")
depends=('xmms' 'unzip')
arch=('any')
source=(https://github.com/Musikolo/arch-linux-aur/raw/master/$pkgname/$pkgname-src-$pkgver.tar.gz)
sha256sums=('223829bab05cac4e6216e5732fdacc475fe956e9fd519156d55f133f27579811')

package() {
  _SKINS_DIR="/Skins"|| return 1
  _INSTALL_DIR="${pkgdir}`xmms-config --data-dir`${_SKINS_DIR}" || return 1
  cd ${srcdir}${_SKINS_DIR}
  install -d ${_INSTALL_DIR} || return 1
  install *  ${_INSTALL_DIR} || return 1
}
