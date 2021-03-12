# Maintainer: GI Jack <GI_Jack@hackermail.com>
#
# Some sloppy repackage of the debian version

pkgname=guilded
pkgver=1.0.990846
pkgrel=1
pkgdesc="That Discord Chat App Knocoff(www.guilded.gg)"
arch=('x86_64')
url="https://www.guilded.gg/"
license=('custom')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core'
	 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
source=("${pkgname}-${pkgver}.deb::https://www.guilded.gg/downloads/Guilded-Linux.deb")
sha256sums=('b2e2a1acd3a3a9d09ba3a8ddc83f91a49157d244a3a0641d20c68910d5537d41')

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
