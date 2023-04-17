# Maintainer : silverhikari <kerrickethan@gmail.com>
# Contributor: xikeon <michael@owens.nl>
# Contributor: GI Jack <GI_Jack@hackermail.com>

pkgname=guilded
pkgver=1.0.9192882
pkgrel=1
pkgdesc="Chat for Gaming Communities"
arch=('x86_64')
url="https://www.guilded.gg/"
license=('custom')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core'
	 'util-linux-libs' 'libappindicator-gtk3' 'libsecret' 'libxkbcommon-x11' "alsa-lib" "libxkbfile")
source=("${pkgname}-${pkgver}.deb::https://www.guilded.gg/downloads/Guilded-Linux.deb")
 sha256sums=('b572169c105670ab9dd29ef30d297bce1c7aad98f50c4a3b0b3a441be0d94c36')

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
