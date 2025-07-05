# Maintainer: Kruemmelbande  (kai.scheufen@gmail.com)
# Contributor: Kruemmelbande
pkgname=slimevr-beta-bin
pkgver=0.16.1rc1
pkgrel=3
epoch=1
pkgdesc="SlimeVR FBT software beta version"
arch=('x86_64')
url="https://github.com/SlimeVR/SlimeVR-Server/"
license=('MIT','Apache-2.0')

depends=('gst-plugins-good' 'cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'jre17-openjdk' 'libappindicator-gtk3' 'libsoup3' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install

source_x86_64=(
  "https://github.com/SlimeVR/SlimeVR-Server/releases/download/v0.16.1-rc.1/SlimeVR-amd64.deb"
)

sha512sums_x86_64=(
  '1103ce83a2c2756354165b0b2b0218fd303eb829d533b1c0bde4fa55ce51598310042fcc08a677dfd7548e88b1c4c16f8447a6a4b2801cb252a2d8e6602c2d55'
)

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
  mkdir -p "${pkgdir}/usr/lib/udev/rules.d/"
  mv "${pkgdir}/lib/udev/rules.d/69-slimevr.rules" "${pkgdir}/usr/lib/udev/rules.d/"
  rmdir "${pkgdir}/lib/udev/rules.d/"
  rmdir "${pkgdir}/lib/udev/"
  rmdir "${pkgdir}/lib/"
  rm "${startdir}/SlimeVR-amd64.deb"
}
