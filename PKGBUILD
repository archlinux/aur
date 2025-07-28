# Maintainer: Kruemmelbande  (kai.scheufen@gmail.com)
# Contributor: Kruemmelbande
pkgname=slimevr-beta-bin
pkgver=0.16.1
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
  "https://github.com/SlimeVR/SlimeVR-Server/releases/download/v0.16.1/SlimeVR-amd64.deb"
)

sha512sums_x86_64=(
  '5345f5c4d72c0874699097abaafb357e78a013e3b6fbbf9b825c0e3bebc3d76d2258cb9a1f2db0fa361ee9928c5b64b82a45a8f576aaad7e413d0adde4e752f5'
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
