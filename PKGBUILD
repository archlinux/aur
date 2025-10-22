# Maintainer: Alper Şal <alper@sal.web.tr>

pkgname=newcp-bin
pkgver=1.6.2
pkgrel=1
pkgdesc='New Club Penguin Electron app'
arch=('x86_64')
url='https://github.com/New-Club-Penguin/NewCP-App-Build/'
license=('MIT')
options=("!strip" "staticlibs")
depends=('gtk3' 'libnotify' 'nss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libdrm' 'mesa' 'libxcb' 'glib2')
provides=('newcp')
source=("https://github.com/New-Club-Penguin/NewCP-App-Build/releases/download/v${pkgver}/newcp_${pkgver}_amd64.deb")
sha256sums=('9f054d4811fe69ad10cc71d969e53d3d247818e8ec70d25a8dbcde0566a582f4')

prepare() {
  mkdir data
  unzstd data.tar.zst
  tar -xvf data.tar -C data
}

package() {
  cp -a  ${srcdir}/data/* ${pkgdir}/
}