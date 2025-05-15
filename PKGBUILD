# Maintainer: Kruemmelbande  (kai.scheufen@gmail.com)
# Contributor: Kruemmelbande
pkgname=slimevr-beta-bin
pkgver=0.15.0rc4
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
  "https://github.com/SlimeVR/SlimeVR-Server/releases/download/v0.15.0-rc.4/SlimeVR-amd64.deb"
  "99-slimedongle.rules"
)

sha512sums_x86_64=(
  'bb8471fed4291bc1ca0b3ac7f093fc9684624e7027131a90ec775823b2a21251a8fd8ef7f1d1967b019ec29575c5c57d1efa60c452a15397fa41c55145783cc5'
  '2e8d5967177bac379e9b02112f0eafe35346f08403913c81fad68c7583876c8475f5811b0c8bd7351dd9580f065aa25bb59427f4182c81c929cbc6d3c24d17ef'
)

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

  #Install udev rules
  install -Dm644 "${srcdir}/99-slimedongle.rules" "${pkgdir}/usr/lib/udev/rules.d/99-slimedongle.rules"

  rm "${startdir}/SlimeVR-amd64.deb"
}
