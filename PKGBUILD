# Maintainer : silverhikari <kerrickethan@gmail.com>
# Contributor: xikeon <michael@owens.nl>
# Contributor: GI Jack <GI_Jack@hackermail.com>

pkgname=guilded
pkgver=1.0.9251387
pkgrel=2
pkgdesc="Chat for Gaming Communities"
arch=('x86_64')
url="https://www.guilded.gg/"
license=('custom')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core'
	 'util-linux-libs' 'libappindicator-gtk3' 'libsecret' 'libxkbcommon-x11' "alsa-lib" "libxkbfile")
source=("${pkgname}-${pkgver}.deb::https://www.guilded.gg/downloads/Guilded-Linux.deb")
 sha256sums=('0540708734b12af51a6e9a980c0bb9b6faf03594a8b43af63e8d62e02916572b')

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
