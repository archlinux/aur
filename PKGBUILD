# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>

pkgname=notepadqq-common
pkgver=0.50.1
_pkgver=0.50.1-0~vivid1
pkgrel=1
pkgdesc="A Linux clone of Notepad++ Common files"
arch=('any')
url="http://notepadqq.altervista.org/wp/"
license=('GPL3')
options=('!strip' '!emptydirs')
depends=('hicolor-icon-theme')
conflicts=('notepadqq-git')
optdepends=('notepadqq-gtk: enables GTK style on startup')
install=${pkgname}.install
sha256sums=('0c109e1fb043ba77180d9575d63b954ecf5aaeb7e56e68a3fcf9d51cd6dbb371')

source=("http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu/pool/main/n/notepadqq/notepadqq-common_${_pkgver}_all.deb")

package() {
  cd "${srcdir}"
  
  bsdtar -xf data.tar.xz --exclude lintian -C "${pkgdir}"
  
  install -Dm644 "${pkgdir}/usr/share/icons/hicolor/scalable/apps/notepadqq.svg" "${pkgdir}/usr/share/pixmaps/notepadqq.svg"
}
