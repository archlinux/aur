# Maintainer: Alper Şal <alper@sal.web.tr>

pkgname=newcp-bin
pkgver=1.5.2
pkgrel=1
pkgdesc='New Club Penguin Electron app'
arch=('x86_64')
url='https://github.com/New-Club-Penguin/NewCP-App-Build/'
license=('MIT')
options=("!strip" "staticlibs")
depends=('gtk3' 'libnotify' 'nss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libdrm' 'mesa' 'libxcb' 'glib2')
provides=('newcp')
source=("https://github.com/New-Club-Penguin/NewCP-App-Build/releases/download/v${pkgver}/newcp_${pkgver}_amd64.deb")
sha256sums=('23f08149246f18a26644449b607b2ab3336bb0f55225fb8134cbd20e22a44716')

prepare() {
  mkdir data
  tar -xvf data.tar.xz -C data
}

package() {
  cp -a  ${srcdir}/data/* ${pkgdir}/
}