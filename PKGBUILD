# Maintainer: Alper Şal <alper@sal.web.tr>

pkgname=newcp-bin
pkgver=1.6.1
pkgrel=0
pkgdesc='New Club Penguin Electron app'
arch=('x86_64')
url='https://github.com/New-Club-Penguin/NewCP-App-Build/'
license=('MIT')
options=("!strip" "staticlibs")
depends=('gtk3' 'libnotify' 'nss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libdrm' 'mesa' 'libxcb' 'glib2')
provides=('newcp')
source=("https://github.com/New-Club-Penguin/NewCP-App-Build/releases/download/v${pkgver}/newcp_${pkgver}_amd64.deb")
sha256sums=('895dfbf6bb98abba70cb5d24e456ffbe367550e3c7e312333d299db7ff14761a')

prepare() {
  mkdir data
  unzstd data.tar.zst
  tar -xvf data.tar -C data
}

package() {
  cp -a  ${srcdir}/data/* ${pkgdir}/
}