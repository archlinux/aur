# Maintainer: GI Jack <GI_Jack@hackermail.com>
#
# Some sloppy repackage of the debian version

pkgname=guilded
pkgver=1.0.995515
pkgrel=1
pkgdesc="That Discord Chat App Knockoff(www.guilded.gg)"
arch=('x86_64')
url="https://www.guilded.gg/"
license=('custom')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core'
	 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
source=("${pkgname}-${pkgver}.deb::https://www.guilded.gg/downloads/Guilded-Linux.deb")
sha256sums=('7d351c91d0830094c00d24ab76dea6756edc61c2c8aca929af45eca2b090cc15')

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
