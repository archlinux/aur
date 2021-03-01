# Maintainer: GI Jack <GI_Jack@hackermail.com>
#
# Some sloppy repackage of the debian version

pkgname=guilded
pkgver=1.0.987755
pkgrel=2
pkgdesc="Discord Chat App Knocoff(www.guilded.gg)"
arch=('x86_64')
url="https://www.guilded.gg/"
license=('custom')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core'
	 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
source=("${pkgname}-${pkgver}.deb::https://www.guilded.gg/downloads/Guilded-Linux.deb")
sha256sums=('30e7a582c70807bb159bbffc3c279563471fcd6786ab89cb9883f4be6d1667cb')

prepare() {
  tar Jxvf data.tar.xz
}

package() {
  cd "${srcdir}"
  cp -r usr "${pkgdir}"
  cp -r opt "${pkgdir}"
  # Link to the binary
  install -dm755 "${pkgdir}/usr/bin/"
  ln -sf "/opt/Guilded/guilded" "${pkgdir}/usr/bin/guilded"
}
