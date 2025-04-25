# Maintainer: Kruemmelbande  (kai.scheufen@gmail.com)
# Contributor: Kruemmelbande
pkgname=slimevr-beta-bin
pkgver=0.15.0rc2
pkgrel=1
epoch=1
pkgdesc="SlimeVR FBT software beta version"
arch=('x86_64')
url="https://github.com/SlimeVR/SlimeVR-Server/"
license=('MIT','Apache-2.0')

depends=('gst-plugins-good' 'cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'jre17-openjdk' 'libappindicator-gtk3' 'libsoup3' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install

source_x86_64=(
  "https://github.com/SlimeVR/SlimeVR-Server/releases/download/v0.15.0-rc.2/SlimeVR-amd64.deb"
  "99-slimedongle.rules"
)

sha512sums_x86_64=(
  'f40e9978f67d297155f4e6ff94c6ece18247ac3be58e3d65d094a433821f00abc0f46f09528a3dde489f43f8dc174de2589d8cacb74d7b791a213063207741db'
  '2e8d5967177bac379e9b02112f0eafe35346f08403913c81fad68c7583876c8475f5811b0c8bd7351dd9580f065aa25bb59427f4182c81c929cbc6d3c24d17ef'
)

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

  #Install udev rules
  install -Dm644 "${srcdir}/99-slimedongle.rules" "${pkgdir}/usr/lib/udev/rules.d/99-slimedongle.rules"

  rm "${startdir}/SlimeVR-amd64.deb"
}
