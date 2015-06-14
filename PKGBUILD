# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>

pkgname=notepadqq-common
pkgver=0.46.0
_pkgver=0.46.0-0~utopic1
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
sha256sums=('f39c4137d48e8532487c08ad4fcff7d5aa2eadc28fb68798690bf2fab3d9c459')

source=("http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu/pool/main/n/notepadqq/notepadqq-common_${_pkgver}_all.deb")

package() {
  cd "${srcdir}"
  
  bsdtar -xf data.tar.xz --exclude lintian -C "${pkgdir}"
  
  install -Dm644 "${pkgdir}/usr/share/icons/hicolor/scalable/apps/notepadqq.svg" "${pkgdir}/usr/share/pixmaps/notepadqq.svg"
}
