# Maintainer : silverhikari <kerrickethan@gmail.com>
# Contributor: xikeon <michael@owens.nl>
# Contributor: GI Jack <GI_Jack@hackermail.com>

pkgname=guilded
pkgver=1.0.9313619
pkgrel=2
pkgdesc="Chat for Gaming Communities"
arch=('x86_64')
url="https://www.guilded.gg/"
license=('nonfree')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core'
 	 'util-linux-libs' 'libappindicator-gtk3' 'libsecret' 'libxkbcommon-x11' "alsa-lib" "libxkbfile" "cairo" "libxext" "libxdamage" "libxfixes" "libx11" "libdrm" "libxcomposite" "glibc" "libxkbcommon" "hicolor-icon-theme" "expat" "glib2" "libxcb" "pango" "libxrandr" "dbus" "mesa" "nspr" "libcups")
source=("${pkgname}-${pkgver}.deb::https://www.guilded.gg/downloads/Guilded-Linux.deb")
 sha256sums=('2ef347a53a3c0022af7a09f796cf4559c5de13279430135bcb24583a419d3ddf')

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
