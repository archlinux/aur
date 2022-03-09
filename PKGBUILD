# Maintainer : silverhikari <kerrickethan@gmail.com>
# Contributor: xikeon <michael@owens.nl>
# Contributor: GI Jack <GI_Jack@hackermail.com>

pkgname=guilded
pkgver=1.0.9126173
pkgrel=1
pkgdesc="Chat for Gaming Communities"
arch=('x86_64')
url="https://www.guilded.gg/"
license=('custom')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core'
	 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
source=("${pkgname}-${pkgver}.deb::https://www.guilded.gg/downloads/Guilded-Linux.deb")
sha256sums=('0b29f5fa9bdb275ec32cf905abd83c9f3fa157a02d7813fc87b842f307bcbd47')

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
