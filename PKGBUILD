# Maintainer: Kruemmelbande  (kai.scheufen@gmail.com)
# Contributor: Kruemmelbande
pkgname=slimevr-beta-bin
pkgver=18.2.0rc1
pkgrel=0
epoch=1
pkgdesc="SlimeVR FBT software beta version"
arch=('x86_64')
url="https://github.com/SlimeVR/SlimeVR-Server/"
license=('MIT','Apache-2.0')

depends=('gst-plugins-good' 'cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'jre17-openjdk' 'libappindicator-gtk3' 'libsoup3' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install

source_x86_64=(
	"https://github.com/SlimeVR/SlimeVR-Server/releases/download/v18.2.0-rc.1/SlimeVR-amd64.deb"
)

sha512sums_x86_64=(
	"a3058f4250dc55f6ea0c72f22e819be4c450d5304935e070bb18dadec02c2d19e188aa444e01e5dbcfca9606e3c013d056b0b637337938827fb09249faed1b2f"
)

package() {

  tar -xz -f data.tar.gz -C "${pkgdir}"
  mkdir -p "${pkgdir}/usr/lib/udev/rules.d/"
  mv "${pkgdir}/lib/udev/rules.d/69-slimevr.rules" "${pkgdir}/usr/lib/udev/rules.d/"
  rmdir "${pkgdir}/lib/udev/rules.d/"
  rmdir "${pkgdir}/lib/udev/"
  rmdir "${pkgdir}/lib/"
  rm "${startdir}/SlimeVR-amd64.deb"
}
